import 'package:flutter/material.dart';

class AntTable extends StatelessWidget {
  const AntTable({super.key, required this.columns, required this.dataSource});

  final List<ColumnOption> columns;
  final List<DataSource> dataSource;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < columns.length; i++)
              Expanded(child: _AntTableHeaderTile(title: columns[i].title)),
          ],
        ),
        for (var i = 0; i < dataSource.length; i++)
          buildTableRow(dataSource[i]),
      ],
    );
  }

  Widget buildTableRow(DataSource dataSource) {
    List<Widget> cells = [];

    for (var i = 0; i < columns.length; i++) {
      Widget cell;
      if (columns[i].builder != null) {
        cell = _AntTableCell(
          child: columns[i].builder!.call(dataSource),
        );
      } else {
        cell = _AntTableCell(
          text: dataSource.toJson()[columns[i].dataIndex].toString(),
        );
      }
      cells.add(Expanded(child: cell));
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black.withOpacity(0.06),
          width: 0.5,
        )),
        color: Colors.white,
      ),
      child: Row(children: cells),
    );
  }
}

class _AntTableHeaderTile extends StatelessWidget {
  const _AntTableHeaderTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.02)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black.withOpacity(0.06),
              width: 0.5,
            ),
            right: BorderSide(
              color: Colors.black.withOpacity(0.06),
              width: 0.5,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.88),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _AntTableCell extends StatelessWidget {
  const _AntTableCell({this.text, this.child});

  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: child ??
          Text(
            text ?? '',
            style: TextStyle(
              color: Colors.black.withOpacity(0.88),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
    );
  }
}

abstract class DataSource {
  Map<String, dynamic> toJson();
}

class ColumnOption {
  ColumnOption({
    this.builder,
    required this.dataIndex,
    required this.key,
    required this.title,
  });

  final Widget Function(DataSource)? builder;
  final String dataIndex;
  final String key;
  final String title;
}
