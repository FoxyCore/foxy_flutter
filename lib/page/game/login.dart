import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/page/game/character.dart';
import 'package:foxy/page/game/server.dart';
import 'package:foxy/provider/account.dart';

class GameLoginPage extends StatefulWidget {
  const GameLoginPage({super.key});

  @override
  State<GameLoginPage> createState() => _GameLoginPageState();
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
              obscureText: widget.obscureText,
              onChanged: widget.onChange,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameLoginPageState extends State<GameLoginPage> {
  String username = 'root';
  String password = 'root';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final bodySmall = textTheme.bodySmall;
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
              obscureText: true,
              placeholder: '密码',
              prefix: const Icon(Icons.lock_outline),
              onChange: (value) => password = value,
            ),
            const SizedBox(height: 16),
            Consumer(builder: (context, ref, child) {
              ref.watch(accountNotifierProvider);
              return ElevatedButton(
                onPressed: () => login(ref),
                child: const SizedBox(
                  height: 48,
                  child: Center(child: Text('登陆')),
                ),
              );
            }),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: selectServer,
                child: Text('艾泽拉斯', style: bodySmall),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login(WidgetRef ref) async {
    try {
      final notifier = ref.read(accountNotifierProvider.notifier);
      await notifier.login(username);
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GameCharacterListPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text(e.toString()),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void selectServer() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final size = mediaQuery.size;
        final width = size.width;
        const padding = EdgeInsets.all(16);
        const height = 48.0;
        final aspectRatio = (width / 2 - padding.left) / height;
        return _Servers(
          padding: padding,
          aspectRatio: aspectRatio,
          height: height,
        );
      },
    );
  }
}

class _Input extends StatefulWidget {
  final bool obscureText;
  final Widget? prefix;
  final String? placeholder;
  final void Function(String)? onChange;
  const _Input({
    this.obscureText = false,
    this.prefix,
    this.placeholder,
    this.onChange,
  });

  @override
  State<_Input> createState() => __InputState();
}

class _Servers extends StatelessWidget {
  final EdgeInsets padding;

  final double aspectRatio;
  final double height;
  const _Servers({
    super.key,
    required this.padding,
    required this.aspectRatio,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final outline = colorScheme.outline;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: padding.bottom,
        crossAxisSpacing: padding.right,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        if (index == 2) {
          return OutlinedButton(
            onPressed: () => navigate(context),
            child: const Text('配置服务器'),
          );
        }
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: outline),
            borderRadius: BorderRadius.circular(height),
          ),
          child: Text('SERVER ${index + 1}'),
        );
      },
      itemCount: 3,
      padding: padding,
    );
  }

  void navigate(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GameServerListPage()),
    );
  }
}
