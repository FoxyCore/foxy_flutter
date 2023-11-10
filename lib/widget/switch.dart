import 'package:flutter/material.dart';
import 'package:foxy/widget/loading.dart';

class AntSwitch extends StatefulWidget {
  const AntSwitch({
    super.key,
    this.checked = false,
    this.loading = false,
    this.onChange,
  });

  final bool checked;
  final bool loading;
  final void Function(bool)? onChange;

  @override
  State<AntSwitch> createState() => _AntSwitchState();
}

class _AntSwitchState extends State<AntSwitch> {
  bool value = false;
  bool pressed = false;

  final duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.loading
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: handleTapDown,
        onTapUp: handleTapUp,
        child: Opacity(
          opacity: widget.loading ? 0.65 : 1,
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: value
                  ? const Color(0xFF1677FF)
                  : Colors.black.withOpacity(0.25),
            ),
            duration: duration,
            height: 22,
            padding: const EdgeInsets.all(2),
            width: 44,
            child: AnimatedAlign(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              duration: duration,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: const Color(0xFF00230B).withOpacity(0.2),
                    )
                  ],
                  color: Colors.white,
                ),
                duration: duration,
                height: 18,
                padding: const EdgeInsets.all(2),
                width: pressed ? 24 : 18,
                child: widget.loading ? const AntLoading() : const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    value = widget.checked;
  }

  @override
  void didUpdateWidget(covariant AntSwitch oldWidget) {
    setState(() {
      value = widget.checked;
    });
    super.didUpdateWidget(oldWidget);
  }

  void handleTapDown(TapDownDetails details) {
    if (widget.loading) return;
    setState(() {
      pressed = true;
    });
  }

  void handleTapUp(TapUpDetails details) {
    if (widget.loading) return;
    setState(() {
      value = !value;
      pressed = false;
    });
    widget.onChange?.call(value);
  }
}
