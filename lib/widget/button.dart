import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foxy/widget/loading.dart';

class AntButton extends StatefulWidget {
  const AntButton({
    super.key,
    this.loading = false,
    this.type,
    this.onClick,
    required this.child,
  });

  final bool loading;
  final ButtonType? type;
  final void Function()? onClick;
  final Widget child;

  @override
  State<AntButton> createState() => _AntButtonState();
}

class _AntButtonState extends State<AntButton> {
  Color borderColor = Colors.black.withOpacity(0.15);
  Color fillColor = Colors.white;
  Color textColor = Colors.black.withOpacity(0.88);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: handleEnter,
        onExit: handleExit,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6),
            color: fillColor,
          ),
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: DefaultTextStyle.merge(
            style: TextStyle(color: textColor, fontSize: 14, height: 1),
            child: Row(
              children: [
                if (widget.loading)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AntLoading(color: textColor),
                  ),
                widget.child
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == ButtonType.primary) {
      borderColor = const Color(0xFF1677FF);
      fillColor = const Color(0xFF1677FF);
      textColor = Colors.white;
    }
  }

  void handleEnter(PointerEnterEvent event) {
    setState(() {
      borderColor = const Color(0xFF4096FF);
      textColor = const Color(0xFF4096FF);
    });
    if (widget.type == ButtonType.primary) {
      setState(() {
        fillColor = const Color(0xFF4096FF);
        textColor = Colors.white;
      });
    }
  }

  void handleExit(PointerExitEvent event) {
    setState(() {
      borderColor = Colors.black.withOpacity(0.15);
      textColor = Colors.black.withOpacity(0.88);
    });
    if (widget.type == ButtonType.primary) {
      setState(() {
        fillColor = const Color(0xFF1677FF);
        textColor = Colors.white;
      });
    }
  }

  void handleTapDown(TapDownDetails event) {
    setState(() {
      borderColor = const Color(0xFF0958D9);
      textColor = const Color(0xFF0958D9);
    });
    if (widget.type == ButtonType.primary) {
      setState(() {
        fillColor = const Color(0xFF0958D9);
        textColor = Colors.white;
      });
    }
  }

  void handleTapUp(TapUpDetails event) {
    setState(() {
      borderColor = const Color(0xFF4096FF);
      textColor = const Color(0xFF4096FF);
    });
    if (widget.type == ButtonType.primary) {
      setState(() {
        fillColor = const Color(0xFF1677FF);
        textColor = Colors.white;
      });
    }
    if (widget.loading) return;
    widget.onClick?.call();
  }
}

enum ButtonType { primary }
