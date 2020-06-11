import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'progress_button/reveal_progress_button.dart';

class ProgressButtonAnimation extends StatefulWidget {
  static const ROUTE_NAME = 'ProgressButtonAnimation';

  final String title;

  ProgressButtonAnimation({this.title});

  @override
  _ProgressButtonAnimationState createState() => _ProgressButtonAnimationState();
}

class _ProgressButtonAnimationState extends State<ProgressButtonAnimation> {
  static const TAG = 'ProgressButtonAnimation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
          child: RevealProgressButton(),
        ),
      ),
    );
  }
}