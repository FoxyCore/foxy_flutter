import 'package:flutter/material.dart';
import 'package:foxy/widget/button.dart';
import 'package:foxy/widget/card.dart';
import 'package:foxy/widget/switch.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: AntCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('World Server'), AntSwitch()],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AntCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Mysql'), AntSwitch()],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: AntCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Auth Server'), AntSwitch()],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        UnconstrainedBox(
          child: AntButton(type: ButtonType.primary, child: Text('开始游戏')),
        )
      ],
    );
  }
}
