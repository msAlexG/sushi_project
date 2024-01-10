import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sushi_project/panels/bottom_panel.dart';
import 'package:sushi_project/panels/catalog_panel.dart';
import 'package:sushi_project/panels/home_adress_panel.dart';
import 'package:sushi_project/panels/promo_panel.dart';
import 'package:sushi_project/panels/shirtMenu/shirt_menu_panel.dart';

//отвечает за структуру главной страницы
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomPanel(),

        //sliver menu
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: HomeAdressPanel(),
              toolbarHeight: 60,
              pinned: true, // не убирать AppBar совсем при скролле
              expandedHeight: 60, // на колько изначально ратягивается AppBar
            ),

            SliverAppBar(
              title: PromoPanel(),

              toolbarHeight: 160,
              pinned: false, // не убирать AppBar совсем при скролле
              expandedHeight: 160, // на колько изначально ратягивается AppBar
            ),

            SliverAppBar(
              title: ShirtMenuPanel(),
              toolbarHeight: 60,
              pinned: true, // не убирать AppBar совсем при скролле
              expandedHeight: 80, // на колько изначально ратягивается AppBar
            ),
            SliverToBoxAdapter(
              child: CatalogPanel(),
            )

            // PromoPanel(), // панель с промоакциями приложения
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
