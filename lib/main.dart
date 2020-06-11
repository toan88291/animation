import 'package:flutter/material.dart';
import 'package:flutteranimation/widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'progress_button_animation/navigation.dart';

void main() {
//  Navigation.initPaths();
  runApp(MaterialApp(
    home: ScaleAnimation(),
//    onGenerateRoute: Navigation.router.generator,
  ));
}

