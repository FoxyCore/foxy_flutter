import 'package:flutter/material.dart';

class AntSpin extends StatefulWidget {
  const AntSpin({super.key});

  @override
  State<AntSpin> createState() => _AntSpinState();
}

class _AntSpinState extends State<AntSpin> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: CurvedAnimation(parent: controller, curve: Curves.linear),
      child: const Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SpinTile(opacity: 0.5),
              SizedBox(width: 4),
              _SpinTile(opacity: 0.3),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SpinTile(opacity: 1),
              SizedBox(width: 4),
              _SpinTile(opacity: 0.6),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _SpinTile extends StatefulWidget {
  const _SpinTile({required this.opacity});

  final double opacity;

  @override
  State<_SpinTile> createState() => _SpinTileState();
}

class _SpinTileState extends State<_SpinTile>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1677FF).withOpacity(controller.value),
          shape: BoxShape.circle,
        ),
        height: 8,
        width: 8,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      lowerBound: 0.1,
      vsync: this,
    );
    controller.value = widget.opacity;
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
