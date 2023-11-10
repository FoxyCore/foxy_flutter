import 'package:flutter/gestures.dart';
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
          _AntTableRow(columns: columns, dataSource: dataSource[i])
      ],
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

class _AntTableRow extends StatefulWidget {
  const _AntTableRow({required this.columns, required this.dataSource});

  final List<ColumnOption> columns;
  final DataSource dataSource;

  @override
  State<_AntTableRow> createState() => __AntTableRowState();
}

class __AntTableRowState extends State<_AntTableRow> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    List<Widget> cells = [];

    for (var i = 0; i < widget.columns.length; i++) {
      Widget cell;
      if (widget.columns[i].builder != null) {
        cell = _AntTableCell(
          child: widget.columns[i].builder!.call(widget.dataSource),
        );
      } else {
        cell = _AntTableCell(
          text: widget.dataSource
              .toJson()[widget.columns[i].dataIndex]
              .toString(),
        );
      }
      cells.add(Expanded(child: cell));
    }
    return GestureDetector(
      child: MouseRegion(
        onEnter: handleEnter,
        onExit: handleExit,
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.06),
                width: 0.5,
              ),
            ),
            color: color,
          ),
          child: Row(children: cells),
        ),
      ),
    );
  }

  void handleEnter(PointerEnterEvent event) {
    setState(() {
      color = Colors.black.withOpacity(0.02);
    });
  }

  void handleExit(PointerExitEvent event) {
    setState(() {
      color = Colors.white;
    });
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
