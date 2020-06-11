import 'dart:math';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ScaleAnimation extends StatefulWidget {
  static const ROUTE_NAME = 'ScaleAnimation';
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  static const TAG = 'ScaleAnimation';

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialAnimation(
          controller: controller,
        ),
      ),
    );
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({ Key key, this.controller }) :

        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.linear
          ),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3, 0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),

        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;


  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Transform.rotate(
            angle: vector.radians(rotation.value),
            child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildButton(0, color: Colors.red, icon: Icons.star),
                  _buildButton(45, color: Colors.green, icon: Icons.star),
                  _buildButton(90, color: Colors.orange, icon: Icons.star),
                  _buildButton(135, color: Colors.blue, icon: Icons.star),
                  _buildButton(180, color: Colors.black, icon: Icons.star),
                  _buildButton(225, color: Colors.indigo, icon: Icons.star),
                  _buildButton(270, color: Colors.pink, icon: Icons.star),
                  _buildButton(315, color: Colors.yellow, icon: Icons.star),
                  Transform.scale(
                    scale: scale.value - 1.5, // subtract the beginning value to run the opposite animation
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: _close,
                        backgroundColor: Colors.red
                    ),
                  ),

                  Transform.scale(
                    scale: scale.value,
                    child: FloatingActionButton(
                        child:
                        Icon(Icons.lens),
                        onPressed: _open
                    ),
                  )
                ]),
          );
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, { Color color, IconData icon }) {
    final double rad = vector.radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (translation.value) * cos(rad),
            (translation.value) * sin(rad)
        ),

        child: FloatingActionButton(
            child: Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
    );
  }

}
