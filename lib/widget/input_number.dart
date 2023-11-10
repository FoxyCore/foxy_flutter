import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AntInputNumber extends StatefulWidget {
  const AntInputNumber({
    super.key,
    this.placeholder,
    this.step = 1,
    this.width,
  });

  final String? placeholder;
  final num step;
  final double? width;

  @override
  State<AntInputNumber> createState() => _AntInputNumberState();
}

class _AntInputNumberState extends State<AntInputNumber> {
  Color border = Colors.black.withOpacity(0.15);
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool hovered = false;
  Color shadow = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleEnter,
      onExit: handleExit,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [BoxShadow(color: shadow, spreadRadius: 2)],
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            width: widget.width ?? 80,
            child: TextField(
              controller: controller,
              cursorColor: Colors.black.withOpacity(0.88),
              cursorHeight: 18,
              cursorWidth: 1,
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 14,
                  height: 22 / 14,
                  color: Colors.black.withOpacity(0.25),
                ),
                hintText: widget.placeholder ?? 'Placeholder',
              ),
              focusNode: focusNode,
              strutStyle: const StrutStyle(forceStrutHeight: true),
              style: TextStyle(
                fontSize: 14,
                height: 22 / 14,
                color: Colors.black.withOpacity(0.88),
              ),
            ),
          ),
          _AntInputNumberOverlay(
            opacity: hovered ? 1 : 0,
            onChange: handleChange,
          ),
        ],
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
        controller.text = (num.tryParse(controller.text) ?? 0).toString();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void handleEnter(PointerEnterEvent event) {
    if (!focusNode.hasFocus) {
      setState(() {
        border = const Color(0xFF1677FF);
      });
    }
    setState(() {
      hovered = true;
    });
  }

  void handleExit(PointerExitEvent event) {
    if (!focusNode.hasFocus) {
      setState(() {
        border = Colors.black.withOpacity(0.15);
      });
    }
    setState(() {
      hovered = false;
    });
  }

  void handleChange(int multiplier) {
    var value = num.tryParse(controller.text) ?? 0;
    value = value + multiplier * widget.step;
    controller.text = value.toString();
  }
}

class _AntInputNumberOverlay extends StatefulWidget {
  const _AntInputNumberOverlay({
    required this.opacity,
    required this.onChange,
  });

  final double opacity;
  final void Function(int) onChange;

  @override
  State<_AntInputNumberOverlay> createState() => __AntInputNumberOverlayState();
}

class __AntInputNumberOverlayState extends State<_AntInputNumberOverlay> {
  double leadingHeight = 15;
  double trailingHeight = 15;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1,
      bottom: 1,
      right: 1,
      width: 20,
      child: AnimatedOpacity(
        opacity: widget.opacity,
        duration: const Duration(milliseconds: 200),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                color: Colors.white,
              ),
              width: 20,
              child: Column(
                children: [
                  _AntInputNumberOverlayTile(
                    height: leadingHeight,
                    icon: Icons.keyboard_arrow_up_outlined,
                    onEnter: () => handleEnter('leading'),
                    onExit: handleExit,
                    onTap: () => handleTap('leading'),
                  ),
                  const _AntInputNumberOverlayDivider(),
                  _AntInputNumberOverlayTile(
                    height: trailingHeight,
                    icon: Icons.keyboard_arrow_down_outlined,
                    onEnter: () => handleEnter('trailing'),
                    onExit: handleExit,
                    onTap: () => handleTap('trailing'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleEnter(String position) {
    setState(() {
      leadingHeight = position == 'leading' ? 18 : 12;
      trailingHeight = position == 'trailing' ? 18 : 12;
    });
  }

  void handleExit() {
    setState(() {
      leadingHeight = 15;
      trailingHeight = 15;
    });
  }

  void handleTap(String position) {
    widget.onChange(position == 'leading' ? 1 : -1);
  }
}

class _AntInputNumberOverlayTile extends StatelessWidget {
  const _AntInputNumberOverlayTile({
    required this.height,
    required this.icon,
    this.onEnter,
    this.onExit,
    this.onTap,
  });

  final double height;
  final IconData icon;
  final void Function()? onEnter;
  final void Function()? onExit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: MouseRegion(
        onEnter: handleEnter,
        onExit: handleExit,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: height,
          width: 20,
          child: Icon(icon, color: Colors.black.withOpacity(0.15), size: 9),
        ),
      ),
    );
  }

  void handleTap() {
    onTap?.call();
  }

  void handleEnter(PointerEnterEvent event) {
    onEnter?.call();
  }

  void handleExit(PointerExitEvent event) {
    onExit?.call();
  }
}

class _AntInputNumberOverlayDivider extends StatelessWidget {
  const _AntInputNumberOverlayDivider();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AntInputNumberOverlayDividerPainter(),
      size: const Size(20, 1),
    );
  }
}

class _AntInputNumberOverlayDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black.withOpacity(0.15);
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
