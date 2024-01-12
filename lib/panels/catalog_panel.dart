import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

//
class CatalogPanel extends StatelessWidget {
  final AutoScrollController autoScrollController;
  const CatalogPanel({super.key, required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      WrapScrollTag(
          autoScrollController: autoScrollController,
          index: 0,
          child: Container(
            height: 600,
            color: Colors.red,
          )),
      WrapScrollTag(
          autoScrollController: autoScrollController,
          index: 1,
          child: Container(
            height: 800,
            color: Colors.yellow,
          )),
      WrapScrollTag(
          autoScrollController: autoScrollController,
          index: 2,
          child: Container(
            height: 800,
            color: Colors.green,
          )),
      WrapScrollTag(
          autoScrollController: autoScrollController,
          index: 3,
          child: Container(
            height: 300,
            color: Colors.blue,
          )),
    ]));
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
