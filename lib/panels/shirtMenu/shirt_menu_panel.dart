import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_project/panels/shirtMenu/bloc/shirt_menu_bloc.dart';

class ShirtMenuPanel extends StatefulWidget {
  const ShirtMenuPanel({super.key});

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
    return Column(
      children: [
        BlocBuilder<ShirtMenuBloc, ShirtMenuState>(
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
              return const Text('Loaded category');
            }
            return const Text('No state');
          },
        ),
        Container(
            color: Colors.red,
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text('menu1'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text('menu2'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text('menu1'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text('menu2'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text('menu1'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text('menu2'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.yellow,
                  child: const Center(
                    child: Text('menu1'),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text('menu2'),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
