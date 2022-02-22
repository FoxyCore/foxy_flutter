import 'dart:math';

import 'package:arco_design_flutter/arco_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foxy_flutter/model/item.dart';
import 'package:foxy_flutter/service/item_template_service.dart';
import 'package:foxy_flutter/widget/left_bar.dart';

class ItemTemplateTable extends StatefulWidget {
  const ItemTemplateTable({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ItemTemplateTable> {
  List<ArcoTableColumn> columns = [
    ArcoTableColumn<ItemTemplate>(title: '编号', dataIndex: 'entry', width: 64.0),
    ArcoTableColumn<ItemTemplate>(title: '名称', dataIndex: 'name', width: 384.0),
    ArcoTableColumn<ItemTemplate>(
        title: '类别', dataIndex: 'class', width: 256.0),
    ArcoTableColumn<ItemTemplate>(title: '子类别', dataIndex: 'subclass'),
    ArcoTableColumn<ItemTemplate>(title: '佩戴位置', dataIndex: 'InventoryType'),
    ArcoTableColumn<ItemTemplate>(title: '物品等级', dataIndex: 'ItemLevel'),
    ArcoTableColumn<ItemTemplate>(title: '需求等级', dataIndex: 'RequiredLevel'),
  ];
  List<ItemTemplate> _items = [];

  @override
  void initState() {
    ItemTemplateService().search().then((value) {
      setState(() {
        _items = value;
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
                            data: _items,
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
    ItemTemplateService().search(page: page).then((value) {
      setState(() {
        _items = value;
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
    ItemTemplateService().search().then((value) {
      setState(() {
        _items = value;
      });
    });
  }
}
