import "package:flutter/material.dart";

class FullScreenModal extends ModalRoute {
  final Widget Function(BuildContext) builder;

  FullScreenModal({required this.builder});

  static Future<void> open(BuildContext context, Widget Function(BuildContext) builder) =>
      Navigator.of(context).push(FullScreenModal(builder: builder));

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      builder(context);

  @override
  bool get maintainState => false;

  @override
  bool get opaque => true;

  @override
  Duration get transitionDuration => Duration.zero;
}
