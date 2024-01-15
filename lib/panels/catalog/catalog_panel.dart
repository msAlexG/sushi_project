import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/models/catalog_model.dart';

////
class CatalogPanel extends StatelessWidget {
  final AutoScrollController autoScrollController;
  const CatalogPanel({super.key, required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        List<Category> category = state.categoryList;
        List<List<Product>> products = state.productList;

        return SliverList.builder(
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            return WrapScrollTag(
                autoScrollController: autoScrollController,
                index: index,
                child: Container(
                  color: Colors.green,
                  // ignore: prefer_const_constructors
                  child: Column(
                    children: [
                      Text(
                        category[index].name,
                        style: const TextStyle(fontSize: 18),
                      ),

                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products[index].length,
                        itemBuilder: (context, elem) {
                          return Container(
                              color: Colors.red,
                              height: 350,
                              child: Text(products[index][elem].name));
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          crossAxisCount: 2,
                        ),
                      )
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: products[index].length,
                      //   itemBuilder: (context, elem) {
                      //     return Container(
                      //         color: Colors.red,
                      //         height: 150,
                      //         child: Text(products[index][elem].name));
                      //   },
                      // )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}

class WrapScrollTag extends StatelessWidget {
  final int index;
  final Widget child;
  final AutoScrollController autoScrollController;
  const WrapScrollTag(
      {super.key,
      required this.index,
      required this.child,
      required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }
}
