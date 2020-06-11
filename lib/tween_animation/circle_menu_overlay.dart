import 'dart:math';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CircleMenuOverlay extends StatefulWidget {
  static const ROUTE_NAME = 'CircleMenuOverlay';
  @override
  _CircleMenuOverlayState createState() => _CircleMenuOverlayState();
}

_buildButton(String message, double angle,
    {Color color,
      IconData icon,
      VoidCallback onPress,
      @required BuildContext context}) {
  final double rad = vector.radians(angle);

  return Positioned(
    bottom: -100 * sin(rad),
    left: MediaQuery.of(context).size.width / 2 - 28 + 100 * cos(rad),
    child: Hero(
        tag: angle,
        child: Tooltip(
          message: '$message',
          child: GestureDetector(
            onTap: onPress,
            child: Container(
              height: 56,
              width: 56,
              child: Icon(
                icon,
                color: Colors.white,
              ),
              decoration: ShapeDecoration(color: color, shape: CircleBorder()),
            ),
          ),
        )),
  );
}

class _CircleMenuOverlayState extends State<CircleMenuOverlay> {
  static const TAG = 'CircleMenuOverlay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      extendBody: false,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildButton('Check In', 0, color: Colors.teal, icon: Icons.check_circle,
                onPress: () {

                }, context: context),
            _buildButton('Add Circle', -45,
                color: Colors.green, icon: Icons.group, context: context),
            _buildButton('Invite', -90,
                color: Colors.lightBlueAccent[700],
                icon: Icons.person_add,
                context: context,
                onPress: () {

                }),
            _buildButton('Add Place', -135,
                color: Colors.amber,
                icon: Icons.place,
                context: context,
                onPress: () {

                }),
            _buildButton('Help Alert', -180,
                color: Colors.brown,
                icon: Icons.warning,
                context: context,
                onPress: () {

                }),
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.clear,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
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
}