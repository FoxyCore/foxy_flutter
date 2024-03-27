import 'package:flutter/material.dart';
import 'package:foxy/widget/button.dart';
import 'package:foxy/widget/input.dart';
import 'package:foxy/widget/input_number.dart';
import 'package:foxy/widget/select.dart';
import 'package:foxy/widget/spin.dart';
import 'package:foxy/widget/switch.dart';
import 'package:foxy/widget/table.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AntButton(
              loading: true,
              type: ButtonType.primary,
              child: Text('Button'),
            ),
            SizedBox(width: 16),
            AntButton(
              type: ButtonType.primary,
              child: Text('Button'),
            ),
            SizedBox(width: 16),
            AntButton(child: Text('Button')),
          ],
        ),
        const AntInputNumber(),
        const AntInput(),
        AntSelect(
          options: List.generate(
            10,
            (index) => SelectOption(
              label: index.toString(),
              value: index,
            ),
          ),
        ),
        const AntSpin(),
        const AntSwitch(loading: true, checked: true),
        AntTable(
          columns: [
            ColumnOption(dataIndex: 'name', key: 'name', title: '姓名'),
            ColumnOption(dataIndex: 'age', key: 'age', title: '年龄'),
            ColumnOption(
              dataIndex: 'address',
              key: 'address',
              title: '住址',
            ),
            ColumnOption(
              dataIndex: 'name',
              key: 'name',
              title: '操作',
              builder: (source) {
                return UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: AntButton(
                    onClick: () {},
                    child: const Text('修改'),
                  ),
                );
              },
            ),
          ],
          dataSource: [
            DataSourceDemo('西湖区湖底公园1号', 32, '1', '胡彦斌'),
            DataSourceDemo('西湖区湖底公园1号', 42, '2', '胡彦祖'),
          ],
        ),
      ],
    );
  }
}

class DataSourceDemo extends DataSource {
  DataSourceDemo(this.address, this.age, this.key, this.name);
  final String address;
  final int age;
  final String key;
  final String name;
  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'age': age,
      'key': key,
      'name': name,
    };
  }
}
