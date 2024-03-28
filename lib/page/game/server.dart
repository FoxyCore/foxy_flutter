import 'package:flutter/material.dart';

class GameServerListPage extends StatelessWidget {
  const GameServerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('服务器列表')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile();
        },
        itemCount: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addServer(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void addServer(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(),
                  const SizedBox(height: 16),
                  TextField(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Center(child: Text('保存')),
                  )
                ],
              ),
            ),
          );
        });
  }
}
