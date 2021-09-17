import 'package:flutter/material.dart';
import 'mainpage/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniNews',
      home: MainPage(),
    );
  }
}
