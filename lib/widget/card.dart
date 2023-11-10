import 'package:flutter/material.dart';

class AntCard extends StatefulWidget {
  const AntCard({super.key, this.child});

  final Widget? child;

  @override
  State<AntCard> createState() => _AntCardState();
}

class _AntCardState extends State<AntCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.06)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(24),
      child: widget.child,
    );
  }
}
