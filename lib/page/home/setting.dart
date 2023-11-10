import 'package:flutter/material.dart';
import 'package:foxy/widget/button.dart';
import 'package:foxy/widget/input.dart';
import 'package:foxy/widget/input_number.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('数据库'),
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            AntInput(placeholder: '地址'),
            AntInputNumber(placeholder: '端口'),
            AntInput(placeholder: '数据库'),
            AntInput(placeholder: '用户名'),
            AntInput(placeholder: '密码'),
          ],
        ),
        Text('服务端'),
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            AntInput(placeholder: 'World Server'),
            AntInput(placeholder: 'Auth Server'),
            AntInput(placeholder: 'Config'),
            AntInput(placeholder: 'DBC'),
          ],
        ),
        Text('客户端'),
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            AntInput(placeholder: 'exe'),
            AntInput(placeholder: 'MPQ'),
          ],
        ),
        Row(
          children: [
            AntButton(type: ButtonType.primary, child: Text('保存')),
            AntButton(child: Text('取消')),
          ],
        )
      ],
    );
  }
}
