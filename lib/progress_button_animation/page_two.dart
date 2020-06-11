import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class PageTwo extends StatefulWidget {
  static const ROUTE_NAME = 'PageTwo';

  final String title;

  PageTwo({Key key, this.title}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  static const TAG = 'PageTwo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}