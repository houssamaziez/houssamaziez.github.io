import 'package:flutter/material.dart';

class LogoZoomInAnimation extends StatefulWidget {
  @override
  _LogoZoomInAnimationState createState() => _LogoZoomInAnimationState();
}

class _LogoZoomInAnimationState extends State<LogoZoomInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset(
          "images/moonlogo.png",
          height: 100,
        ),
      ),
    );
  }
}
