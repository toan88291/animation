import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ChainingAndComposingAnimations extends StatefulWidget {
  static const ROUTE_NAME = 'ChainingAndComposingAnimations';
  @override
  _ChainingAndComposingAnimationsState createState() => _ChainingAndComposingAnimationsState();
}

class _ChainingAndComposingAnimationsState extends State<ChainingAndComposingAnimations>
    with TickerProviderStateMixin {
  static const TAG = 'ChainingAndComposingAnimations';

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future _startAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: GestureDetector(
          onTap: () {
            _startAnimation();
          },
          child: Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: Colors.blueGrey.withOpacity(0.8),
                ),
              ),
              child: AnimatedBox(
                controller: _controller,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBox extends StatelessWidget {

  final Animation<double> controller;

  final Animation<double> opacity;

  final Animation<double> width;

  final Animation<double> height;

  final Animation<EdgeInsets> movement;

  final Animation<BorderRadius> radius;

  final Animation<Color> color;

  final Animation<double> rotate;

  AnimatedBox({Key key, this.controller})
      : opacity = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,
        0.0,
        curve: Curves.fastOutSlowIn,
      ),
    ),
  ),
        rotate = Tween<double>(
          begin: 0.0,
          end: 3.141 * 2,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.1,
              0.2,
              curve: Curves.ease,
            ))),
        movement = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 10.0, left: 0.0),
          end: EdgeInsets.only(bottom: 100.0, left: 75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.2,
              0.4,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 50.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.4,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 50.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.4,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        radius = BorderRadiusTween(
          begin: BorderRadius.circular(0.0),
          end: BorderRadius.circular(100.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              0.75,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.red[200],
          end: Colors.deepPurple[900],
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.75,
              curve: Curves.linear,
            ))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
//          padding: movement.value,
          transform: Matrix4.identity()..rotateZ(rotate.value),
          alignment: Alignment.center,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.cyan,
                  width: 2.0,
                ),
//                borderRadius: radius.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
