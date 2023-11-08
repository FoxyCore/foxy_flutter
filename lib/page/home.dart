import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foxy/page/game.dart';
import 'package:foxy/widget/input.dart';
import 'package:foxy/widget/spin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.people),
                        label: Text('Creature'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.games_outlined),
                        label: Text('Game'),
                      ),
                    ],
                    selectedIndex: 0,
                    onDestinationSelected: (index) =>
                        handleDestinationSelected(context, index),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 64,
                  width: 64,
                  child: const Icon(Icons.settings_outlined),
                ),
              ],
            ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Input(), AntSpin()],
            ),
          )
        ],
      ),
    );
  }

  void handleDestinationSelected(BuildContext context, int index) {
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return const GamePage();
      }));
    }
  }
}
