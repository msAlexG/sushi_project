import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/panels/bottom_panel.dart';
import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/panels/catalog_panel.dart';
import 'package:sushi_project/panels/home_adress_panel.dart';
import 'package:sushi_project/panels/promo_panel.dart';

import 'package:sushi_project/panels/shirt_menu_panel.dart';

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
            body: HomePageWidget()),
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
  AutoScrollController catalogAutoScrollController = AutoScrollController();
  AutoScrollController menuAutoScrollController = AutoScrollController();

  @override
  void initState() {
    context.read<CatalogBloc>().add(const CatalogGet());

    super.initState();
  }

  @override
  void dispose() {
    catalogAutoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //InViewNotifierCustomScrollView обертка над CustomScrollView
    return InViewNotifierCustomScrollView(
      //   physics: ScrollPhysics(),
      shrinkWrap: true,
      //параметр isInViewPortCondition отвечает за то в каком месте отлавливать виджет который скролится (умножить на 0,01 отлавливать
      // в верху экрана если ужножить на 0,05 то посередине экрана )
      isInViewPortCondition:
          (double deltaTop, double deltaBottom, double vpHeight) {
        return deltaTop + 240 < (0.1 * (vpHeight)) &&
            deltaBottom + 240 > (0.1 * (vpHeight));
      },
      scrollDirection: Axis.vertical,
      controller: catalogAutoScrollController,
      slivers: [
        // сливер аппбар ввиде панели с адресом клиента
        const HomeAdressPanel(),
        // сливер аппбар ввиде панели с промо акциями
        const PromoPanel(),

        // сливер аппбар ввиде меню
        ShirtMenuPanel(
          catalogAutoScrollController: catalogAutoScrollController,
          menuAutoScrollController: menuAutoScrollController,
        ),
        // сливер лист в виде каталога меню
        CatalogPanel(
          catalogController: catalogAutoScrollController,
          menuController: menuAutoScrollController,
        ),
      ],
    );
  }
}
