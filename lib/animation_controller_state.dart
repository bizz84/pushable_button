import 'package:flutter/material.dart';

/// abstract class to reduce animation controller boilerplate
/// See: https://codewithandrea.com/videos/reduce-animation-controller-boilerplate-flutter-hooks/
abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);
  final Duration animationDuration;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
