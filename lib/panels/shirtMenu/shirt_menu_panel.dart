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
                itemCount: state.category.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Icon(Icons.menu);
                  } else {
                    return GestureDetector(
                      onTap: () {
                        context.read<ShirtMenuBloc>().add(ShirtMenuClicked(
                            index - 1, widget.autoScrollController));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.start,
                            state.category[index - 1].name,
                            style: const TextStyle(color: Colors.black),
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
