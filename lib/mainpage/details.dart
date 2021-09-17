import 'package:flutter/material.dart';
// import 'package:gesture_detector/mainpage/information.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  // final int index;
  // // ignore: deprecated_member_use
  // var news = List<News>();
  // Details({this.index,this.news});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image(
              image: NetworkImage(''),
            ),
          ),
        ],
      ),
    );
  }
}
