import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HorizontalAnim extends StatelessWidget {
  final int index;
  final Widget child;
  // final Duration? delay;
  const HorizontalAnim({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 300),
      child: SlideAnimation(
        verticalOffset: 0.0,
        horizontalOffset: 30.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}

class VerticalAnim extends StatelessWidget {
  final int index;
  final Widget child;
  // final Duration? delay;
  const VerticalAnim({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 200),
      child: SlideAnimation(
        verticalOffset: 30.0,
        horizontalOffset: 0.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}