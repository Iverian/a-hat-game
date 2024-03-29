import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class MenuItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool enabled;

  const MenuItem({
    required this.title,
    this.onTap,
    this.onLongPress,
    bool? enabled,
    super.key,
  }) : enabled = enabled ?? true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: ListTile(
        title: Text(
          title,
          style: style,
          textAlign: TextAlign.center,
        ),
        enabled: enabled,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("title", title))
      ..add(ObjectFlagProperty<void Function()?>.has("onTap", onTap))
      ..add(
          ObjectFlagProperty<void Function()?>.has("onLongPress", onLongPress),)
      ..add(DiagnosticsProperty<bool>("enabled", enabled));
  }
}
