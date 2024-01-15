import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/panels/shirtMenu/bloc/shirt_menu_bloc.dart';

class ShirtMenuPanel extends StatefulWidget {
  final AutoScrollController autoScrollController;
  const ShirtMenuPanel({super.key, required this.autoScrollController});

  @override
  State<ShirtMenuPanel> createState() => _ShirtMenuPanelState();
}

class _ShirtMenuPanelState extends State<ShirtMenuPanel> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  void initState() {
    context.read<ShirtMenuBloc>().add(ShirtMenuGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShirtMenuBloc, ShirtMenuState>(
      builder: (context, state) {
        if (state is ShirtMenuInitial) {
          print('true');
          return Container();
        } else if (state is ShirtMenuLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ShirtMenuError) {
          return const Text('text error state');
        } else if (state is ShirtMenuLoaded) {
          return Container(
              height: 60,
              child: ListView.builder(
                controller: _controller,
                itemCount: state.category.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Icon(Icons.menu);
                  } else {
                    return GestureDetector(
                      onTap: () {
                        _controller.scrollToIndex(index - 1,
                            duration: const Duration(seconds: 1),
                            preferPosition: AutoScrollPosition.begin);
                        context.read<ShirtMenuBloc>().add(ShirtMenuClicked(
                            index - 1, widget.autoScrollController));
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
                                state.category[index - 1].name,
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
        }
        return const Text('No state');
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
