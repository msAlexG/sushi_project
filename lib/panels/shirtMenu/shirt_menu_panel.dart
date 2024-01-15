import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/bloc/catalogBloc/catalog_bloc.dart';
import 'package:sushi_project/models/catalog_model.dart';

class ShirtMenuPanel extends StatelessWidget {
  final AutoScrollController autoScrollController;
  const ShirtMenuPanel({super.key, required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    final AutoScrollController _controller = AutoScrollController();
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        final List<Category> category = state.categoryList;
        return Container(
            height: 60,
            child: ListView.builder(
              controller: _controller,
              itemCount: category.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Icon(Icons.menu);
                } else {
                  return GestureDetector(
                    onTap: () {
                      _controller.scrollToIndex(index - 1,
                          duration: const Duration(seconds: 1),
                          preferPosition: AutoScrollPosition.begin);
                      // context.read<CatalogBloc>().add(ShirtMenuClicked(
                      //     index - 1, this.autoScrollController));
                      context.read<CatalogBloc>().add(ShirtMenuClicked(
                          index - 1, this.autoScrollController));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: WrapScrollTag(
                          autoScrollController: _controller,
                          index: index - 1,
                          child: Container(
                            child: Text(
                              textAlign: TextAlign.start,
                              category[index - 1].name,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              scrollDirection: Axis.horizontal,
            ));
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
