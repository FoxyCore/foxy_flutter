import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

class QuestView extends StatefulWidget {
  const QuestView({super.key});

  @override
  State<QuestView> createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView> {
  List<Map> quests = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: ListView(
            children: const [
              ListTile(
                title: Text('Map 1'),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                    '[${quests[index]['QuestLevel'] ?? ''}]${quests[index]['Title'] ?? ''}'),
                subtitle: Text(quests[index]['Details'] ?? ''),
              );
            },
            itemCount: quests.length,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getQuests();
  }

  void getQuests() async {
    final pool = MySQLConnectionPool(
      host: '192.168.1.166',
      port: 3306,
      userName: 'remote',
      password: 'remote',
      maxConnections: 10,
      databaseName: 'world', // optional,
    );
    var result = await pool.execute(
        'select qt.QuestLevel, qtl.Title, qtl.Details from quest_template as qt left join quest_template_locale as qtl on qt.ID = qtl.ID and qtl.locale = "zhCN" where qt.QuestSortID = 12 order by qt.QuestLevel asc limit 25');
    for (final row in result.rows) {
      setState(() {
        quests.add(row.assoc());
      });
    }
  }
}
