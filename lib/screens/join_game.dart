import "dart:async";
import "dart:developer" as dev;
import "dart:io";

import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nsd/nsd.dart";

import "../const.dart";
import "../provider.dart";
import "../service_data.dart";
import "splash.dart";

final discoveryProvider = ChangeNotifierProvider.autoDispose((ref) => _DiscoveryNotifier());

class JoinGameScreen extends ConsumerWidget {
  const JoinGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(discoveryProvider.select((value) => value.isLoading))) {
      return const SplashScreen();
    }

    final services = ref.watch(discoveryProvider.select((value) => value.services));
    dev.log("services: $services");
    return Scaffold(
      body: ListView(
        children: services.map(_ServiceListTile.new).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // TODO: replace with real QR code scanning
          // This is Android emulator meme,
          // enable by redirecting emulator port 9010 to host
          // and hosting a game on that emulator
          ref.read(gameProvider).join(
                playerName: ref.read(pNamePod),
                address: InternetAddress("10.0.2.2"),
                port: 9010,
                code: null,
              );
        },
        child: const Icon(Icons.qr_code),
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
        ref.read(gameProvider).join(
              playerName: ref.read(pNamePod),
              address: _data.address!,
              port: _data.port,
              // TODO: add code input
              code: null,
            );
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
