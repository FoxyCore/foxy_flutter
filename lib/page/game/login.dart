import 'package:flutter/material.dart';
import 'package:foxy/page/game/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/provider/account.dart';

class GameLoginPage extends StatefulWidget {
  const GameLoginPage({super.key});

  @override
  State<GameLoginPage> createState() => _GameLoginPageState();
}

class _GameLoginPageState extends State<GameLoginPage> {
  String username = 'root';
  String password = 'root';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('FOXY'),
            const SizedBox(height: 16),
            _Input(
              placeholder: '账号',
              prefix: const Icon(Icons.person_outline),
              onChange: (value) => username = value,
            ),
            const SizedBox(height: 16),
            _Input(
              placeholder: '密码',
              prefix: const Icon(Icons.lock_outline),
              onChange: (value) => password = value,
            ),
            const SizedBox(height: 16),
            Consumer(builder: (context, ref, child) {
              ref.watch(accountNotifierProvider);
              return ElevatedButton(
                onPressed: () => handlePressed(ref),
                child: const SizedBox(
                  height: 48,
                  child: Center(child: Text('LOGIN')),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void handlePressed(WidgetRef ref) async {
    final notifier = ref.read(accountNotifierProvider.notifier);
    await notifier.login(username);
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GameCharacterListPage()),
    );
  }
}

class _Input extends StatefulWidget {
  const _Input({this.prefix, this.placeholder, this.onChange});

  final Widget? prefix;
  final String? placeholder;
  final void Function(String)? onChange;

  @override
  State<_Input> createState() => __InputState();
}

class __InputState extends State<_Input> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final outline = colorScheme.outline;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: outline),
        borderRadius: BorderRadius.circular(24),
      ),
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.prefix != null) ...[
            widget.prefix!,
            const SizedBox(width: 8)
          ],
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: widget.placeholder ?? '请输入',
              ),
              onChanged: widget.onChange,
            ),
          ),
        ],
      ),
    );
  }
}
