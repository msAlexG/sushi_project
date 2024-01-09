import 'package:flutter/material.dart';
import 'package:sushi_project/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

// second commit
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
