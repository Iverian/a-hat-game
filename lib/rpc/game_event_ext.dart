import "../generated/proto/error.pb.dart";
import "../generated/proto/service.pb.dart";
import "../generated/proto/state.pb.dart";

extension GameEventExt on GameEvent {
  static GameEvent doHandshakeOk() => GameEvent(handshake: FallibleResponse(ok: Empty()));

  static GameEvent doHandshakeErr(ErrorCode code) =>
      GameEvent(handshake: FallibleResponse(err: ProtocolError(code: code)));

  static GameEvent doShutdown() => GameEvent(
        shutdown: EventShutdown(),
      );

  static GameEvent doAck() => GameEvent(
        ack: EventAck(),
      );

  static GameEvent doRewind(GameState state) => GameEvent(
        rewind: EventRewind(state: state),
      );

  static GameEvent doPatch(GameStatePatch patch) => GameEvent(
        patch: EventPatch(patch: patch),
      );

  bool needsConfirm() => whichKind() == GameEvent_Kind.patch && patch.patch.confirm;
  bool isAck() => whichKind() == GameEvent_Kind.ack;
}
