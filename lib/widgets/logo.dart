import "package:flutter/material.dart";

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 60,
      fontWeight: FontWeight.w900,
    );
    return Text(
      "ШЛЯПА",
      style: style,
    );
  }
}
