import "package:flutter/material.dart";

class MainMenuItem extends StatelessWidget {
  final String _title;
  final void Function()? _onTap;

  const MainMenuItem({
    super.key,
    required String title,
    void Function()? onTap,
  })  : _title = title,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(_title),
          onTap: _onTap,
        ),
      );
}
