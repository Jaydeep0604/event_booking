import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedItem(BuildContext context, int index,
        Animation<double> animation, Widget child) =>
    // For example wrap with fade transition
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: child,
      ),
    );

class FadeLiveWidget extends StatelessWidget {
  final Widget child;
  const FadeLiveWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisible(
        key: key!,
        builder: (context, animation) => FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              // And slide transition
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.3, 0),
                  end: Offset.zero,
                ).animate(animation),
                // Paste you Widget
                child: child,
              ),
            ));
  }
}
