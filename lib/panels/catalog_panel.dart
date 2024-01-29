import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/models/catalog_model.dart';

class CatalogPanel extends StatelessWidget {
  final AutoScrollController catalogController;
  final AutoScrollController menuController;

  const CatalogPanel({
    super.key,
    required this.catalogController,
    required this.menuController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        List<Category> category = state.categoryList;
        List<GlobalKey> keys = state.keys;
        List<List<Product>> products = state.productList;

        return SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return BlocSelector<CatalogBloc, CatalogState, bool>(
                        selector: (state) {
                          return state.menuClicked == false;
                        },
                        builder: (context, topMenuWasClicked) {
                          //InViewNotifierWidget виджет который просматривает видимость самого себя на экране
                          return InViewNotifierWidget(
                              id: "$index",
                              builder: (BuildContext context, bool isInView,
                                  Widget? child) {
                                if (topMenuWasClicked) {
                                  if (isInView == true) {
                                    context.read<CatalogBloc>().add(
                                        ShirtMenuClicked(
                                            menuIndex: index,
                                            catalogControler: catalogController,
                                            key: keys[index],
                                            menuControler: menuController,
                                            menuClickedState: false));
                                  }
                                }

                                return GestureDetector(
                                  onPanDown: (details) {
                                    context
                                        .read<CatalogBloc>()
                                        .add(const MenuToggleClicked());
                                  },
                                  child: Container(
                                    key: keys[index],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Column(
                                      children: [
                                        Text(
                                          category[index].name,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: products[index].length,
                                          itemBuilder: (context, elem) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black12,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            products[index]
                                                                    [elem]
                                                                .img,
                                                        placeholder: (context,
                                                                url) =>
                                                            const CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Text(
                                                      products[index][elem]
                                                          .name,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Text(products[index]
                                                            [elem]
                                                        .weight),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: Colors.red),
                                                        width: double.infinity,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Center(
                                                              child: Text(
                                                            "2000p",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisSpacing: 16,
                                                  crossAxisSpacing: 16,
                                                  crossAxisCount: 2,
                                                  mainAxisExtent: 250),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                    })));
      },
    );
  }
}