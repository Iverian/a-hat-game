import "dart:async";
import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
import "package:nsd/nsd.dart";

import "../const.dart";
import "../provider.dart";
import "../service_data.dart";
import "../util.dart";
import "game.dart";

final _discoveryPod = ChangeNotifierProvider.autoDispose((ref) => _DiscoveryNotifier());

class JoinGameScreen extends ConsumerWidget {
  const JoinGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(_discoveryPod.select((value) => value.isLoading));
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.bouncingBall(
            color: Theme.of(context).primaryColor,
            size: 100,
          ),
        ),
      );
    }

    final services = ref.watch(_discoveryPod.select((value) => value.services));
    dev.log("services: $services");
    return Scaffold(
      body: ListView(
        children: services.map(_ServiceListTile.new).toList(),
      ),
    );
  }
}

class _ServiceListTile extends ConsumerWidget {
  final ServiceData _data;

  const _ServiceListTile(ServiceData data, {super.key}) : _data = data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPrivate = _data.isPrivate ? "X" : "O";
    return ListTile(
      title: Text("${_data.name}#${_data.idSuffix}"),
      subtitle: Text("$isPrivate / ${_data.playerName} / ${_data.address!.address}:${_data.port}"),
      onTap: () async {
        ref.read(gamePod).join(
              playerName: ref.read(pNamePod),
              address: _data.address!,
              port: _data.port,
              // TODO: add code input
              code: null,
            );
        await navReplace(context, (_) => GameScreen());
      },
    );
  }
}

class _DiscoveryNotifier extends ChangeNotifier {
  bool isLoading = true;
  Map<String, ServiceData> data = {};
  Discovery? discovery;

  _DiscoveryNotifier() {
    unawaited(_startDiscovery());
  }

  List<ServiceData> get services => data.values.toList();

  @override
  void dispose() {
    super.dispose();
    unawaited(_stopDiscovery());
  }

  void _updateService(Service service, ServiceStatus status) {
    switch (status) {
      case ServiceStatus.found:
        final svcData = ServiceData.fromService(service);
        if (svcData != null) {
          data[svcData.id] = svcData;
          notifyListeners();
        }
        break;
      case ServiceStatus.lost:
        if (data.remove(service.name) != null) {
          notifyListeners();
        }
        break;
    }
  }

  Future<void> _startDiscovery() async {
    discovery = await startDiscovery(kNetworkServiceType, ipLookupType: IpLookupType.v4);
    dev.log("started discovery");
    discovery!.addServiceListener(_updateService);
    isLoading = false;
    notifyListeners();
  }

  Future<void> _stopDiscovery() async {
    if (discovery == null) {
      return;
    }
    await stopDiscovery(discovery!);
    dev.log("stopped discovery");
    discovery!.dispose();
  }
}
