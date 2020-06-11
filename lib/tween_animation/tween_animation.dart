import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'circle_menu_overlay.dart';
import 'transparent_route.dart';

class TweenAnimation extends StatefulWidget {
  static const ROUTE_NAME = 'TweenAnimation';
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  static const TAG = 'TweenAnimation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildButton(0,Colors.teal,icon: Icons.check_circle),
          _buildButton(-45,Colors.pink,icon: Icons.check_circle),
          _buildButton(-90,Colors.yellow,icon: Icons.check_circle),
          _buildButton(-135,Colors.blue,icon: Icons.check_circle),
          _buildButton(-180,Colors.lightGreenAccent,icon: Icons.check_circle),
          FloatingActionButton(
            clipBehavior: Clip.antiAlias,
            child: Icon(
              CupertinoIcons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).push(TransparentRoute(builder: (context) {
                return CircleMenuOverlay();
              }));
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Material(
          child: SafeArea(
              child: Container(
                height: 52,
                color: Colors.deepPurpleAccent,
              )
          ),
        ),
      ),
    );
  }

  _buildButton(double angle, Color color, {IconData icon}){
    return Hero(
      tag: angle,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

}