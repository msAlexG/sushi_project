import 'package:flutter/material.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      //selectedIconTheme: IconThemeData(color: Colors.red),
      // selectedLabelStyle: TextStyle(color: Colors.red),
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFf5f5f5),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Меню',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Профиль',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trip_origin),
          label: 'Home2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Информация',
        ),
      ],
    );
  }
}
