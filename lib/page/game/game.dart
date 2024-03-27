import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/model/area_table.dart';
import 'package:foxy/model/character.dart';
import 'package:foxy/model/quest_template.dart';
import 'package:foxy/page/game/home/character.dart';
import 'package:foxy/provider/area_table.dart';
import 'package:foxy/provider/character.dart';
import 'package:foxy/provider/quest_template.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class __AreaTableBottomSheetState extends ConsumerState<_AreaTableBottomSheet> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(areaTablesNotifierProvider);
      List<AreaTable> areaTables = switch (provider) {
        AsyncData(:final value) => value,
        _ => [],
      };
      return ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(areaTables[index].areaNameLangZhCN),
          );
        },
        itemCount: areaTables.length,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() async {
    final areaTables = await ref.read(areaTablesNotifierProvider.future);
    final character = await ref.watch(characterNotifierProvider.future);
    final index = areaTables.indexWhere((element) {
      return element.id == character.zone;
    });
    final offset = index >= 0 ? index * 56.0 : 0.0;
    controller.jumpTo(offset);
  }
}

class _AreaTableBottomSheet extends ConsumerStatefulWidget {
  const _AreaTableBottomSheet();

  @override
  ConsumerState<_AreaTableBottomSheet> createState() =>
      __AreaTableBottomSheetState();
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/area_table_3843.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}

class _GamePageState extends State<GamePage> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            const _Background(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _MapSelector(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Builder(builder: (context) {
                        return switch (selectedIndex) {
                          1 => const CharacterPage(),
                          2 => const _CombatPage(),
                          _ => const SizedBox(width: double.infinity)
                        };
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: '主城'),
            NavigationDestination(
              icon: Icon(Icons.gamepad_outlined),
              label: '角色',
            ),
            NavigationDestination(
              icon: Icon(Icons.play_circle_outline),
              label: '战斗',
            ),
            NavigationDestination(
                icon: Icon(Icons.group_outlined), label: '伙伴'),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: '打造',
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: handleDestinationSelected,
        ),
      ),
    );
  }

  void handleDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class _CombatPage extends StatelessWidget {
  const _CombatPage();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(flex: 3, child: SizedBox()),
              Expanded(flex: 2, child: _QuestList()),
            ],
          ),
        ),
        SizedBox(height: 16),
        Expanded(child: _LogList()),
      ],
    );
  }
}

class _LogList extends StatelessWidget {
  const _LogList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black.withOpacity(0.25),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Text('记录'), Expanded(child: Container())],
      ),
    );
  }
}

class _MapSelector extends StatelessWidget {
  const _MapSelector();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => changeZone(context),
      child: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(areaTablesNotifierProvider);
        List<AreaTable> areaTables = switch (provider) {
          AsyncData(:final value) => value,
          _ => [],
        };
        final characterProvider = ref.watch(characterNotifierProvider);
        final character = switch (characterProvider) {
          AsyncData(:final value) => value,
          _ => Character()
        };
        final areaTable = areaTables.where((element) {
          return element.id == character.zone;
        }).firstOrNull;
        return Text(areaTable?.areaNameLangZhCN ?? '未知地区');
      }),
    );
  }

  void changeZone(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const _AreaTableBottomSheet();
      },
    );
  }
}

class _QuestList extends StatelessWidget {
  const _QuestList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black.withOpacity(0.25),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('当前任务 / 可用任务'),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final provider = ref.watch(activeQuestsNotifierProvider);
              List<QuestTemplate> quests = switch (provider) {
                AsyncData(:final value) => value,
                _ => [],
              };
              return ListView.builder(
                itemBuilder: (context, index) {
                  final quest = quests[index];
                  final title =
                      '${index + 1}.[${quest.questLevel}级]${quest.title}';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text(title), Text(quest.objectives)],
                  );
                  // return ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   minVerticalPadding: 0,
                  //   title: Text(title),
                  //   subtitle: Text(quest.objectives),
                  //   onTap: () {
                  //     print(quest.objectives);
                  //   },
                  // );
                },
                itemCount: quests.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
