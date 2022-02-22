import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:foxy_flutter/page/creature/creature_template_table.dart';
import 'package:foxy_flutter/page/home.dart';
import 'package:foxy_flutter/page/item/item_template_table.dart';
import 'package:foxy_flutter/page/not_found.dart';

void main() {
  runApp(MaterialApp.router(
    routeInformationParser: BeamerParser(),
    routerDelegate: BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/': (context, state, data) => const BeamPage(
                key: ValueKey('home'),
                title: 'Home',
                child: Home(),
                type: BeamPageType.noTransition,
              ),
          '/creature-template-table': (context, state, data) => const BeamPage(
                key: ValueKey('creature-template-table'),
                title: 'Creature Template Table',
                child: CreatureTemplateTable(),
                type: BeamPageType.noTransition,
              ),
          '/item-template-table': (context, state, data) => const BeamPage(
                key: ValueKey('item-template-table'),
                title: 'Item Template Table',
                child: ItemTemplateTable(),
                type: BeamPageType.noTransition,
              ),
        },
      ),
      notFoundPage: const BeamPage(
        key: ValueKey('404'),
        title: 'Not Found',
        child: FoxyNotFound(),
        type: BeamPageType.noTransition,
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
