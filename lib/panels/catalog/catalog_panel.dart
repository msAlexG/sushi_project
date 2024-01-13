import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/panels/catalog/bloc/catalog_bloc.dart';
import 'package:sushi_project/panels/shirtMenu/model/category.dart';

////
class CatalogPanel extends StatelessWidget {
  final AutoScrollController autoScrollController;
  const CatalogPanel({super.key, required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        List<CategoryModel> catalog = state.categoryList;
        return SliverList.builder(
          itemCount: catalog.length,
          itemBuilder: (BuildContext context, int index) {
            return WrapScrollTag(
                autoScrollController: autoScrollController,
                index: index,
                child: Container(
                  height: 800,
                  color: Colors.green,
                  child: Text(catalog[index].name),
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
