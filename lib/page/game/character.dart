import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/model/character.dart';
import 'package:foxy/page/game/game.dart';
import 'package:foxy/provider/character.dart';

class GameCharacterListPage extends StatelessWidget {
  const GameCharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('角色列表')),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(charactersNotifierProvider);
          List<Character> characters = switch (provider) {
            AsyncData(:final value) => value,
            _ => [],
          };
          return ListView.builder(
            itemBuilder: (context, index) {
              return Consumer(builder: (context, ref, child) {
                ref.watch(characterNotifierProvider);
                return ListTile(
                  leading: Text(characters[index].race.toString()),
                  subtitle: Text(characters[index].gameClass.toString()),
                  title: Text(
                    '${characters[index].name} [${characters[index].level}级]',
                  ),
                  onTap: () => handleTap(context, ref, index),
                );
              });
            },
            itemCount: characters.length,
          );
        },
      ),
    );
  }

  void handleTap(BuildContext context, WidgetRef ref, int index) async {
    final characters = await ref.read(charactersNotifierProvider.future);
    final notifier = ref.read(characterNotifierProvider.notifier);
    await notifier.link(characters[index].guid);
    if (!context.mounted) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GamePage(),
    ));
  }
}
