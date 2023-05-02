import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final String text;

  const AnimateText({Key? key, required this.text}) : super(key: key);

  @override
  State<AnimateText> createState() => _FadTextState();
}

class _FadTextState extends State<AnimateText> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<Offset> position;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    opacity = Tween(begin: 1.0, end: 0.0).animate(controller);
    scale = Tween(begin: 1.0, end: 0.9).animate(controller);
    position = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero,).animate(controller);
    controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: SlideTransition(
          position: position,
          child: FadeTransition(
            opacity: opacity,
            child: Text(widget.text),
          )),
    );
  }
}