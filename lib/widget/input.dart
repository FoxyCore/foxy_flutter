import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AntInput extends StatefulWidget {
  const AntInput({super.key, this.placeholder, this.width});

  final String? placeholder;
  final double? width;

  @override
  State<AntInput> createState() => _AntInputState();
}

class _AntInputState extends State<AntInput> {
  FocusNode focusNode = FocusNode();
  Color border = Colors.black.withOpacity(0.15);
  Color shadow = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleEnter,
      onExit: handleExit,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(color: shadow, spreadRadius: 2)],
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        width: widget.width ?? 360,
        child: TextField(
          decoration: InputDecoration.collapsed(
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              height: 22 / 14,
              color: Colors.black.withOpacity(0.25),
            ),
            hintText: widget.placeholder ?? 'Placeholder',
          ),
          style: TextStyle(
            fontSize: 14,
            height: 22 / 14,
            color: Colors.black.withOpacity(0.88),
          ),
          strutStyle: const StrutStyle(forceStrutHeight: true),
          cursorWidth: 1,
          cursorHeight: 18,
          cursorColor: Colors.black.withOpacity(0.88),
          focusNode: focusNode,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          border = const Color(0xFF1677FF);
          shadow = const Color(0xFF0591FF).withOpacity(0.1);
        });
      } else {
        setState(() {
          border = Colors.black.withOpacity(0.15);
          shadow = Colors.transparent;
        });
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void handleEnter(PointerEnterEvent event) {
    if (!focusNode.hasFocus) {
      setState(() {
        border = const Color(0xFF1677FF);
      });
    }
  }

  void handleExit(PointerExitEvent event) {
    if (!focusNode.hasFocus) {
      setState(() {
        border = Colors.black.withOpacity(0.15);
      });
    }
  }
}
