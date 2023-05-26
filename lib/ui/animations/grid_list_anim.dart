import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GrideListAnim extends StatelessWidget {
  final int index;
  final Widget child;
  final Duration? delay;
  const GrideListAnim(
      {Key? key, required this.child, required this.index, this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 3,
      position: index,
      duration: const Duration(milliseconds: 150),
      delay: delay,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
