import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

const defaultTextStyle = TextStyle(
  color: Colors.blue,
  fontSize: 15,
);

class GesturesAnimation extends StatefulWidget {
  static const ROUTE_NAME = 'GesturesAnimation';
  @override
  _GesturesAnimationState createState() => _GesturesAnimationState();
}

class _GesturesAnimationState extends State<GesturesAnimation> {
  static const TAG = 'GesturesAnimation';

  StreamController<double> controller = StreamController.broadcast();

  double position;

  TextStyle textStyle = defaultTextStyle;

  @override
  Widget build(BuildContext context) {
    final maxPosition = MediaQuery
        .of(context)
        .size
        .height - 300;
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
              child: Text('Show Buttom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StreamBuilder(
                        stream: controller.stream,
                        builder: (context, snapshot) =>
                            GestureDetector(
                                onVerticalDragUpdate: (
                                    DragUpdateDetails details) {
                                  position = MediaQuery
                                      .of(context)
                                      .size
                                      .height -
                                      details.globalPosition.dy;
                                  double newPosition = position;

                                  if (position > maxPosition) {
                                    newPosition = maxPosition;
                                  }
                                  if (position < 100) {
                                    newPosition = 100;
                                  }
                                  controller.add(newPosition);

                                  textStyle = TextStyle.lerp(
                                      defaultTextStyle,
                                      TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                      newPosition / maxPosition);
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  color: Colors.white,
                                  height: snapshot.hasData ? snapshot.data : 100.0,
                                  width: double.infinity,
                                  child: Text(
                                    'Reviews',
                                    style: textStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                      );
                    });
              }),
        ),
      ),
    );
  }
}