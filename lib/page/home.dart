import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foxy/page/game.dart';
import 'package:foxy/widget/input.dart';
import 'package:foxy/widget/input_number.dart';
import 'package:foxy/widget/select.dart';
import 'package:foxy/widget/spin.dart';
import 'package:foxy/widget/switch.dart';
import 'package:foxy/widget/table.dart';

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
                  height: 72,
                  width: 72,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ),
              ],
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const AntInputNumber(),
                const AntInput(),
                AntSelect(
                  options: List.generate(
                    10,
                    (index) => SelectOption(
                      label: index.toString(),
                      value: index,
                    ),
                  ),
                ),
                const AntSpin(),
                const AntSwitch(loading: true, checked: true),
                AntTable(
                  columns: [
                    ColumnOption(dataIndex: 'name', key: 'name', title: '姓名'),
                    ColumnOption(dataIndex: 'age', key: 'age', title: '年龄'),
                    ColumnOption(
                      dataIndex: 'address',
                      key: 'address',
                      title: '住址',
                    ),
                    ColumnOption(
                      dataIndex: 'name',
                      key: 'name',
                      title: '操作',
                      builder: (source) {
                        return UnconstrainedBox(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('修改'),
                          ),
                        );
                      },
                    ),
                  ],
                  dataSource: [
                    DataSourceDemo('西湖区湖底公园1号', 32, '1', '胡彦斌'),
                    DataSourceDemo('西湖区湖底公园1号', 42, '2', '胡彦祖'),
                  ],
                ),
              ],
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

class DataSourceDemo extends DataSource {
  DataSourceDemo(this.address, this.age, this.key, this.name);
  final String address;
  final int age;
  final String key;
  final String name;
  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'age': age,
      'key': key,
      'name': name,
    };
  }
}
