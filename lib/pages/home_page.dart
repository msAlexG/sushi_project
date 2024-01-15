import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:sushi_project/panels/bottom_panel.dart';
import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/panels/catalog_panel.dart';
import 'package:sushi_project/panels/home_adress_panel.dart';
import 'package:sushi_project/panels/promo_panel.dart';

import 'package:sushi_project/panels/shirtMenu/shirt_menu_panel.dart';

//отвечает за структуру главной страницы
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatalogBloc(),
        ),
      ],
      child: const SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomPanel(),
            // ignore: unnecessary_const
            body: const HomePageWidget()),
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
  });

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  AutoScrollController _autoScrollController = AutoScrollController();
  final scrollDirection = Axis.vertical;

  @override
  void initState() {
    context.read<CatalogBloc>().add(const CatalogGet());

    super.initState();
  }

  @override
  void dispose() {
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _autoScrollController,
      slivers: [
        const HomeAdressPanel(), // сливер аппбар ввиде панели с адресом клиента
        const PromoPanel(), // сливер аппбар ввиде панели с промо акциями
        SliverAppBar(
            // сливер аппбар ввиде меню
            title: ShirtMenuPanel(autoScrollController: _autoScrollController),
            toolbarHeight: 80,
            pinned: true, // не убирать AppBar совсем при скролле
            expandedHeight: 80 // на колько изначально ратягивается AppBar
            ),
        CatalogPanel(
            autoScrollController:
                _autoScrollController), // сливер лист в виде каталога меню
      ],
    );
  }
}
