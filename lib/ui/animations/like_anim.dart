import 'package:flutter/material.dart';

class LikeAnim extends StatefulWidget {
  Widget child;
  bool isAnimating;

  LikeAnim({Key? key, required this.child, this.isAnimating = false})
      : super(key: key);

  @override
  State<LikeAnim> createState() => _LikeAnimState();
}

class _LikeAnimState extends State<LikeAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: 200),
    );
    scale = Tween<double>(begin: 1, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future doAnimation() async {
    if (widget.isAnimating) {
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }

  @override
  void didUpdateWidget(LikeAnim oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
  }
}
