import 'dart:math';

import 'package:flutter/material.dart';

class AntLoading extends StatefulWidget {
  const AntLoading({
    super.key,
    this.color = const Color(0xFF1677FF),
    this.size = const Size.square(14),
    this.width = 1,
  });

  final Color color;
  final Size size;
  final double width;

  @override
  State<AntLoading> createState() => _AntLoadingState();
}

class _AntLoadingState extends State<AntLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> turns;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: turns,
      child: CustomPaint(
        painter: _AntLoadingPainter(color: widget.color, width: widget.width),
        size: widget.size,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    turns = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AntLoadingPainter extends CustomPainter {
  _AntLoadingPainter({required this.color, required this.width});
  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = color;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(rect, pi * 3 / 2, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
