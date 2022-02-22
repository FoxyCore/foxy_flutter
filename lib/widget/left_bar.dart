import 'package:arco_design_flutter/arco_design_flutter.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatefulWidget {
  const LeftBar({Key? key, this.current = '/'}) : super(key: key);

  final String current;

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> {
  static List<_Menu> menus = [
    _Menu(name: '/', icon: Icons.grid_view_outlined),
    _Menu(
        name: '/creature-template-table', icon: Icons.account_circle_outlined),
    _Menu(name: '/item-template-table', icon: Icons.layers_outlined),
    _Menu(name: '/game-object', icon: Icons.explore_outlined),
    _Menu(name: '/quest', icon: Icons.quiz_outlined),
    _Menu(name: '/gossip-menu', icon: Icons.chat_bubble_outline),
    _Menu(name: '/smart-script', icon: Icons.code),
    _Menu(name: '/spell', icon: Icons.storm_outlined),
    _Menu(name: '/advance', icon: Icons.more_horiz_outlined),
    _Menu(name: '/setting', icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: ArcoColors.black, size: 24.0),
      child: ArcoMenu(
        mode: ArcoMenuMode.pop,
        defaultSelectedKeys: [widget.current],
        children: menus
            .map(
              (menu) => ArcoMenuItem(
                name: menu.name,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Icon(menu.icon),
                ),
              ),
            )
            .toList(),
        onMenuItemClick: _handleMenuItemClick,
      ),
    );
  }

  void _handleMenuItemClick(String name) {
    context.beamToNamed(name);
  }
}

class _Menu {
  String name;
  IconData icon;

  _Menu({required this.name, required this.icon});
}
