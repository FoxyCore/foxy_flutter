import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'asset/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleButton(child: Text('主城')),
                    const CircleButton(child: Text('任务')),
                    const CircleButton(child: Text('地下城')),
                    const CircleButton(child: Text('背包')),
                    CircleButton(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Text('退出'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  const CircleButton({super.key, required this.child, this.onTap});

  final Widget child;
  final void Function()? onTap;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: handleEnter,
        onExit: handleExit,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
          height: 64,
          margin: const EdgeInsets.all(8),
          width: 64,
          child: widget.child,
        ),
      ),
    );
  }

  void handleEnter(PointerEnterEvent event) {}

  void handleExit(PointerExitEvent event) {}
}
