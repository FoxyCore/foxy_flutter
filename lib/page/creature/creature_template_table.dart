import 'dart:math';

import 'package:arco_design_flutter/arco_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foxy_flutter/model/creature.dart';
import 'package:foxy_flutter/service/creature_template_service.dart';
import 'package:foxy_flutter/widget/left_bar.dart';

class CreatureTemplateTable extends StatefulWidget {
  const CreatureTemplateTable({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreatureTemplateTable> {
  List<ArcoTableColumn> columns = [
    ArcoTableColumn<CreatureTemplate>(
        title: '编号', dataIndex: 'entry', width: 64.0),
    ArcoTableColumn<CreatureTemplate>(
        title: '名称', dataIndex: 'name', width: 256.0),
    ArcoTableColumn<CreatureTemplate>(
        title: '子名称', dataIndex: 'subname', width: 256.0),
    ArcoTableColumn<CreatureTemplate>(title: '最低等级', dataIndex: 'minlevel'),
    ArcoTableColumn<CreatureTemplate>(title: '最高等级', dataIndex: 'maxlevel'),
    ArcoTableColumn<CreatureTemplate>(title: '人工智能', dataIndex: 'AIName'),
    ArcoTableColumn<CreatureTemplate>(title: '脚本', dataIndex: 'ScriptName'),
  ];
  List<CreatureTemplate> _creatures = [];

  @override
  void initState() {
    CreatureTemplateService().search().then((value) {
      setState(() {
        _creatures = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var toolbar = Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ArcoButton(
              child: const Text('新增'),
              type: ArcoButtonType.primary,
              onClick: _handleCreate,
            ),
            ArcoButton(
              child: const Text('查询'),
              onClick: _handleSearch,
            ),
          ],
        ),
        const ArcoPagination(total: 100),
      ],
    );
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LeftBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                // shrinkWrap: true,
                controller: ScrollController(),
                children: [
                  ArcoCard(
                    child: Column(
                      children: [
                        toolbar,
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ArcoTable(
                            columns: columns,
                            data: _creatures,
                            bordered: false,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCreate() {
    var page = Random().nextInt(100);
    CreatureTemplateService().search(page: page).then((value) {
      setState(() {
        _creatures = value;
      });
    });
  }

  void _handleSearch() {
    ArcoDrawer(context,
        placement: ArcoDrawerPlacement.left,
        title: const Text('查询生物模板'),
        child: Column(
          children: [
            const ArcoInput(),
            const ArcoInput(),
            const ArcoInput(),
            Row(children: const [
              ArcoButton(child: Text('确定')),
              ArcoButton(child: Text('取消')),
            ])
          ],
        ));
    CreatureTemplateService().search().then((value) {
      setState(() {
        _creatures = value;
      });
    });
  }
}
