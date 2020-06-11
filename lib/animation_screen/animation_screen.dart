import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class AnimationScreen extends StatefulWidget {
  static const ROUTE_NAME = 'AnimationScreen';

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  static const TAG = 'AnimationScreen';

  Animation _animation, _delayedAnimation, _muchDelayedAnimation;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: 2)
        , vsync: this
    );

    _delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.5,1.0, curve: Curves.fastOutSlowIn
            )
        )
    );

    _muchDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.8,1.0, curve: Curves.fastOutSlowIn
            )
        )
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn)
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Text(
                        'Say Hello'
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(_delayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Text(
                        'Say Hello 2'
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(_muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Text(
                        'Say Hello 3'
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}