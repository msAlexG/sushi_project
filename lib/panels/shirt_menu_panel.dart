import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/models/catalog_model.dart';

import 'package:sushi_project/resources/widgets/wrap_widgets_for_scroll.dart';

class ShirtMenuPanel extends StatelessWidget {
  final AutoScrollController catalogAutoScrollController;
  final AutoScrollController menuAutoScrollController;
  const ShirtMenuPanel(
      {super.key,
      required this.catalogAutoScrollController,
      required this.menuAutoScrollController});

  @override
  Widget build(BuildContext context) {
    // контроллер для скролла меню
    return SliverAppBar(
      toolbarHeight: 80,
      pinned: true, // не убирать AppBar совсем при скролле
      expandedHeight: 80, // на колько изначально ратягивается AppBar
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          final List<Category> category = state.categoryList;
          final List<GlobalKey> keys = state.keys;
          return SizedBox(
              height: 60,
              child: Row(
                children: [
                  const Icon(Icons.menu),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: menuAutoScrollController,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            context.read<CatalogBloc>().add(ShirtMenuClicked(
                                catalogControler: catalogAutoScrollController,
                                menuIndex: index,
                                key: keys[index],
                                menuControler: menuAutoScrollController,
                                menuClickedState: true));
                          },
                          child: BlocSelector<CatalogBloc, CatalogState, bool>(
                            selector: (state) {
                              return state.carentMenuIndex == index;
                            },
                            builder: (context, selected) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? Color(0xFFf32b2b)
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  alignment: Alignment.center,

                                  //к виджетам обернытым в  WrapScrollTag мы скроллемся
                                  child: WrapScrollTag(
                                    autoScrollController:
                                        menuAutoScrollController,
                                    index: index,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        category[index].name,
                                        style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
