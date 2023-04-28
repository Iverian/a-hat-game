import "dart:async";
import "dart:developer" as dev;

import "package:async/async.dart";
import "package:flutter/material.dart";
import "package:grpc/grpc.dart";
import "package:mutex/mutex.dart";

import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";
import "../rpc/error.dart";
import "../rpc/game_client.dart";
import "../rpc/game_event_ext.dart";
import "../rpc/game_state_manager.dart";

class GameClientStateNotifier {
  final BaseGameClient _client;
  final GameStateManager _state;
  final _ListenerLock _listener;

  GameClientStateNotifier({required BaseGameClient client})
      : _client = client,
        _state = GameStateManager(),
        _listener = _ListenerLock();

  GameState get state => _state.inner;

  int get playerId => _client.playerId;

  BaseGameClient get client => _client;

  // TODO: add reconnect handling
  void addListener(VoidCallback listener, {VoidCallback? onExit}) {
    unawaited(() async {
      await _listener.add(listener);
      await _doListen(onExit);
    }());
  }

  Future<void> removeListener() async {
    await _listener.remove();
  }

  Future<void> _doListen(VoidCallback? onExit) async {
    while (true) {
      try {
        await _handleEvents();
        dev.log("finished listen loop");
        onExit?.call();
        break;
      } on RpcError catch (e) {
        dev.log("unhandled rpc error: $e");
        await Future.delayed(const Duration(seconds: 1));
        dev.log("reconnecting");
      } on GrpcError catch (e) {
        dev.log("unhandled grpc error: $e");
        await Future.delayed(const Duration(seconds: 1));
        dev.log("reconnecting");
      }
    }
  }

  Future<void> _handleEvents() async {
    final q = StreamQueue(_client.subscribe());

    final handshakeMsg = await q.next;
    if (handshakeMsg.handshake.whichResult() == FallibleResponse_Result.err) {
      throw RpcError.fromProtocolErr(handshakeMsg.handshake.err);
    }

    while (await _listener.isPresent()) {
      final event = await q.next;
      switch (event.whichKind()) {
        case GameEvent_Kind.shutdown:
          return;
        case GameEvent_Kind.rewind:
          await _listener.notifyAfter(() async {
            dev.log(
              "rewinding state of ${_client.playerId} to rev ${event.rewind.state.rev}: ${event.rewind.state}",
            );
            _state.rewind(event.rewind.state);
          });
          break;
        case GameEvent_Kind.patch:
          await _listener.notifyAfter(() async {
            dev.log(
              "updating state of ${_client.playerId} to rev ${event.patch.patch.rev}: ${event.patch.patch}",
            );
            final rev = _state.apply(event.patch.patch);
            if (event.needsConfirm()) {
              dev.log("confirming patch $rev");
              await _client.confirm(rev: rev);
              final ack = await q.next;
              if (!ack.isAck()) {
                throw RpcError();
              }
            }
          });
          break;
        case GameEvent_Kind.ack:
        case GameEvent_Kind.handshake:
        case GameEvent_Kind.notSet:
          throw UnimplementedError();
      }
    }
  }
}

class _ListenerLock {
  final Mutex _lock;
  VoidCallback? _callback;

  _ListenerLock() : _lock = Mutex();

  Future<bool> isPresent() => _lock.protect(() async {
        return _callback != null;
      });

  Future<void> add(VoidCallback callback) => _lock.protect(() async {
        _callback = callback;
      });

  Future<void> remove() => _lock.protect(() async {
        _callback = null;
      });

  Future<T> notifyAfter<T>(Future<T> Function() func) => _lock.protect(() async {
        final result = await func();
        _callback?.call();
        return result;
      });
}
