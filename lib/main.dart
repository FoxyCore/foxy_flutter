import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxy/page/game/login.dart';
import 'package:foxy/service/service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceInitializer().ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GameLoginPage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
