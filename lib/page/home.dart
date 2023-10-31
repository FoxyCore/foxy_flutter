import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foxy/page/game.dart';

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
                  child: Icon(Icons.settings_outlined),
                ),
              ],
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  void handleDestinationSelected(BuildContext context, int index) {
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return GamePage();
      }));
    }
  }
}
