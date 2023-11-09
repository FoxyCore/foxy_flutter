import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AntSelect extends StatefulWidget {
  const AntSelect({
    super.key,
    this.options = const <SelectOption>[],
    this.placeholder,
    this.showSearch = false,
    this.width,
  });

  final List<SelectOption> options;
  final String? placeholder;
  final bool showSearch;
  final double? width;

  @override
  State<AntSelect> createState() => _AntSelectState();
}

class _AntSelectState extends State<AntSelect> {
  Color border = Colors.black.withOpacity(0.15);
  TextEditingController controller = TextEditingController();
  late OverlayEntry? entry;
  FocusNode focusNode = FocusNode();
  int? selectedIndex;
  LayerLink link = LayerLink();
  Color shadow = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: handleTap,
      child: MouseRegion(
        onEnter: handleEnter,
        onExit: handleExit,
        child: CompositedTransformTarget(
          link: link,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [BoxShadow(color: shadow, spreadRadius: 2)],
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            width: widget.width ?? 320,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration.collapsed(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        height: 22 / 14,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      hintText: widget.placeholder ?? 'Placeholder',
                    ),
                    mouseCursor:
                        widget.showSearch ? null : SystemMouseCursors.click,
                    readOnly: !widget.showSearch,
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
                const Icon(Icons.keyboard_arrow_down_outlined),
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
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          border = const Color(0xFF1677FF);
          shadow = const Color(0xFF0591FF).withOpacity(0.1);
        });
        handleTap();
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
  }

  void handleExit(PointerExitEvent event) {
    if (!focusNode.hasFocus) {
      setState(() {
        border = Colors.black.withOpacity(0.15);
      });
    }
  }

  void handleSelect(int index) {
    removeOverlay();
    setState(() {
      selectedIndex = index;
    });
    controller.text = widget.options[index].label;
  }

  void handleTap() {
    final overlay = Overlay.of(context);
    entry = OverlayEntry(builder: (context) {
      return _AntSelectOverlay(
        link: link,
        options: widget.options,
        selectedIndex: selectedIndex,
        onSelect: handleSelect,
        onTap: removeOverlay,
      );
    });
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
  }
}

class _AntSelectOverlay extends StatelessWidget {
  const _AntSelectOverlay({
    super.key,
    required this.link,
    required this.options,
    this.selectedIndex,
    required this.onSelect,
    required this.onTap,
  });

  final LayerLink link;
  final List<SelectOption> options;
  final int? selectedIndex;
  final void Function(int) onSelect;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: CompositedTransformFollower(
          link: link,
          offset: const Offset(0, 4),
          targetAnchor: Alignment.bottomLeft,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.12),
                    offset: const Offset(0, 3),
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    blurRadius: 28,
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 9),
                    spreadRadius: 8,
                  ),
                ],
                color: Colors.white,
              ),
              height: 200,
              padding: const EdgeInsets.all(4),
              width: 320,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return _AntSelectOverlayTile(
                    label: options[index].label,
                    selected: index == selectedIndex,
                    onTap: () => onSelect(index),
                  );
                },
                itemCount: options.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AntSelectOverlayTile extends StatefulWidget {
  const _AntSelectOverlayTile({
    super.key,
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final void Function() onTap;

  @override
  State<_AntSelectOverlayTile> createState() => __AntSelectOverlayTileState();
}

class __AntSelectOverlayTileState extends State<_AntSelectOverlayTile> {
  bool hovered = false;
  Color? color;

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (widget.selected) {
      color = const Color(0xFFE6F4FF);
    } else {
      if (hovered) {
        color = Colors.black.withOpacity(0.04);
      }
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: handleEnter,
        onExit: handleExit,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.88),
                  fontSize: 14,
                  height: 22 / 14,
                ),
              ),
              if (widget.selected)
                const Icon(
                  Icons.check_outlined,
                  color: Color(0xFF1677FF),
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void handleEnter(PointerEnterEvent event) {
    setState(() {
      hovered = true;
    });
  }

  void handleExit(PointerExitEvent event) {
    setState(() {
      hovered = false;
    });
  }
}

class SelectOption<T> {
  SelectOption({required this.label, required this.value});

  String label;
  T value;
}
