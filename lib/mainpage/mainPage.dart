import 'package:flutter/material.dart';
import 'package:gesture_detector/mainpage/body.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF81D4FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF81D4FA),
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Mini',
              style: TextStyle(fontSize: 30.0, color: Color(0xFF039BE5)),
            ),
            Text(
              'News',
              style: TextStyle(fontSize: 30.0, color: Color(0xFF01579B)),
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
