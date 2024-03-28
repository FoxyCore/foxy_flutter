import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/model/character_inventory.dart';
import 'package:foxy/provider/character_inventory.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2, child: _CharacterAttributes()),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black.withOpacity(0.25),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('背包'),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final provider =
                        ref.watch(characterInventoriesNotifierProvider);
                    List<CharacterInventory> characterInventories =
                        switch (provider) {
                      AsyncData(:final value) => value,
                      _ => [],
                    };
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        final inventory = characterInventories[index];
                        return _Inventory(inventory: inventory);
                      },
                      itemCount: characterInventories.length,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CharacterAttributes extends StatelessWidget {
  const _CharacterAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final provider = ref.watch(equippedCharacterInventoriesNotifierProvider);
      List<CharacterInventory> inventories = switch (provider) {
        AsyncData(:final value) => value,
        _ => [],
      };
      return LayoutBuilder(builder: (context, constraints) {
        final height = constraints.maxHeight;
        final heightPerInventory = (height - 4 * 7) / 8;
        final size = Size.square(heightPerInventory);
        return Row(
          children: [
            Column(
              children: [
                _Inventory(
                    inventory: findInventory(inventories, 0), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 1), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 2), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 14), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 4), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, -1), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 19), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 8), size: size),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Placeholder()),
                  Row(
                    children: [
                      Expanded(
                        child: Column(children: [
                          Text('基础属性'),
                          Text('力量：'),
                          Text('敏捷：'),
                          Text('耐力：'),
                          Text('智力：'),
                          Text('精神：'),
                          Text('护甲：'),
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Text('法术'),
                          Text('伤害加成：'),
                          Text('治疗加成：'),
                          Text('命中等级：'),
                          Text('暴击率：'),
                          Text('急速等级：'),
                          Text('法力回复：'),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Inventory(
                        inventory: findInventory(inventories, 15),
                        size: size,
                      ),
                      const SizedBox(width: 4),
                      _Inventory(
                        inventory: findInventory(inventories, 18),
                        size: size,
                      ),
                      const SizedBox(width: 4),
                      _Inventory(
                        inventory: findInventory(inventories, 17),
                        size: size,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _Inventory(
                    inventory: findInventory(inventories, 9), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 5), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 6), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 7), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 10), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 11), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 12), size: size),
                const SizedBox(height: 4),
                _Inventory(
                    inventory: findInventory(inventories, 13), size: size),
              ],
            ),
          ],
        );
      });
    });
  }

  CharacterInventory? findInventory(
    List<CharacterInventory> inventories,
    int slot,
  ) {
    return inventories.where((element) => element.slot == slot).firstOrNull;
  }
}

class _Inventory extends StatelessWidget {
  const _Inventory({this.inventory, this.size});

  final CharacterInventory? inventory;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    const colors = [
      Colors.grey,
      Colors.white,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.red,
    ];
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final bodyLarge = textTheme.bodyLarge;
    final path = inventory?.icon.toLowerCase() ?? '';
    final icon = 'asset/icon/$path.png';
    var count = '';
    if (inventory != null) {
      count = inventory!.count > 1 ? '${inventory!.count}' : '';
    }
    Color? borderColor;
    if (inventory != null) {
      borderColor = colors[inventory!.quality];
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(4),
        color: borderColor?.withOpacity(0.25) ?? Colors.black.withOpacity(0.25),
      ),
      height: size?.height,
      padding: const EdgeInsets.all(2),
      width: size?.width,
      child: inventory != null
          ? Stack(
              children: [
                Center(
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Text(
                    count,
                    style: bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          : null,
    );
  }
}
