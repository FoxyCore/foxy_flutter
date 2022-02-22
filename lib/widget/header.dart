import 'package:arco_design_flutter/arco_design_flutter.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArcoCard(
      child: ArcoBreadcrumb(children: [
        ArcoBreadcrumbItem(child: Text('主页')),
        ArcoBreadcrumbItem(child: Text('控制面板')),
      ]),
      size: ArcoCardSize.small,
    );
  }
}
