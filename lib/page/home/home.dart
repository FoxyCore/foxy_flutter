import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foxy/page/game.dart';
import 'package:foxy/page/home/demo.dart';
import 'package:foxy/page/home/launcher.dart';
import 'package:foxy/page/home/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (index) {
      case 0:
        child = const LauncherPage();
        break;
      case 1:
        child = const DemoPage();
        break;
      case null:
        child = const SettingPage();
        break;
      default:
        child = const SizedBox();
        break;
    }
    return Scaffold(
      body: Row(
        children: [
          if (Platform.isMacOS || Platform.isWindows)
            Column(
              children: [
                Expanded(
                  child: NavigationRail(
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.rocket_launch_outlined),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.people_outline),
                        label: Text('Creature'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.games_outlined),
                        label: Text('Game'),
                      ),
                    ],
                    selectedIndex: index,
                    onDestinationSelected: handleDestinationSelected,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 72,
                  width: 72,
                  child: IconButton(
                    onPressed: () => handleDestinationSelected(null),
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ),
              ],
            ),
          Expanded(
            child: Padding(padding: const EdgeInsets.all(16), child: child),
          )
        ],
      ),
    );
  }

  void handleDestinationSelected(int? index) {
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const GamePage();
      }));
    } else {
      setState(() {
        this.index = index;
      });
    }
  }
}
