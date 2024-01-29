import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// Вспамагательный виджет, если в него обернуть виджет, то можно сделать к этому виджету scroll
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
