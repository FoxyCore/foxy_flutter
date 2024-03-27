import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/model/character_inventory.dart';
import 'package:foxy/provider/character_inventory.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2, child: SizedBox()),
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

class _Inventory extends StatelessWidget {
  const _Inventory({required this.inventory});

  final CharacterInventory inventory;

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
    final icon = 'asset/icon/${inventory.icon.toLowerCase()}.png';
    final count = inventory.count > 1 ? '${inventory.count}' : '';
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors[inventory.quality]),
        borderRadius: BorderRadius.circular(4),
        color: colors[inventory.quality].withOpacity(0.25),
      ),
      padding: const EdgeInsets.all(2),
      child: Stack(
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
      ),
    );
  }
}
