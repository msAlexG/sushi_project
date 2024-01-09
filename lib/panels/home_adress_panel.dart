import 'package:flutter/material.dart';

class HomeAdressPanel extends StatelessWidget {
  const HomeAdressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.yellow,
        height: 40,
        child: const Center(
          child: Text('Adress panel'),
        ));
  }
}
