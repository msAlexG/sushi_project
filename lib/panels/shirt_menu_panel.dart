import 'package:flutter/material.dart';

class ShirtMenuPanel extends StatelessWidget {
  const ShirtMenuPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
