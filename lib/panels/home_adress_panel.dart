import 'package:flutter/material.dart';

class HomeAdressPanel extends StatelessWidget {
  const HomeAdressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 60,
      pinned: true, //закрепить Adress panel при прокрутке
      expandedHeight: 60,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Container(
          width: double.infinity,
          color: Colors.yellow,
          height: 40,
          child: const Center(
            child: Text('Adress panel'),
          )),
    );
  }
}
