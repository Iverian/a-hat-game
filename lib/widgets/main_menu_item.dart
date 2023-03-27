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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        title: Text(
          _title,
          style: style,
        ),
        onTap: _onTap,
      ),
    );
  }
}
