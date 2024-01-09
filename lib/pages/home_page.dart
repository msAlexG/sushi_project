import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sushi_project/panels/bottom_panel.dart';
import 'package:sushi_project/panels/catalog_panel.dart';
import 'package:sushi_project/panels/home_adress_panel.dart';
import 'package:sushi_project/panels/promo_panel.dart';
import 'package:sushi_project/panels/shirt_menu_panel.dart';

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              HomeAdressPanel(), // панель с адресом доставки
              SizedBox(height: 16),
              PromoPanel(), // панель с промоакциями приложения
              SizedBox(height: 20),
              ShirtMenuPanel(), // панель с меню
              SizedBox(height: 20),
              CatalogPanel(), // панель с катологом товаров
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
