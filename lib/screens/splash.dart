import "package:flutter/material.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: LoadingAnimationWidget.bouncingBall(
            color: Theme.of(context).primaryColor,
            size: 100,
          ),
        ),
      );
}
