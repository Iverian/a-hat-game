import "dart:async";
import "dart:developer" as dev;

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nsd/nsd.dart";

import "../const.dart";

class JoinGameScreen extends HookConsumerWidget {
  const JoinGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(true);
    final services = useState<List<Service>>([]);

    useEffect(
      () {
        Discovery? discovery;

        void updateServices() => services.value = discovery!.services;

        Future(() async {
          discovery = await startDiscovery(
            networkServiceType,
            ipLookupType: IpLookupType.v4,
          );
          discovery?.addListener(updateServices);
          updateServices();
          isLoading.value = false;
          dev.log("started network discovery");
        });

        return () async {
          if (discovery != null) {
            await stopDiscovery(discovery!);
          }
          dev.log("stopped network discovery");
          discovery?.removeListener(updateServices);
          discovery?.dispose();
        };
      },
      const [],
    );

    return Scaffold(
      body: ListView(
        children: services.value.map((i) => _buildService(context, i)).toList(),
      ),
    );
  }

  Widget _buildService(BuildContext context, Service service) => Card(
        child: ListTile(
          title: Text(service.name!),
          subtitle: Text("port: ${service.port}"),
        ),
      );
}
