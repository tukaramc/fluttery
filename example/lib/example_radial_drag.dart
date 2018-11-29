import 'package:flutter/material.dart';
import 'package:fluttery/gestures.dart';

class RadialDragExampleScreen extends StatefulWidget {
  @override
  _RadialDragExampleState createState() => new _RadialDragExampleState();
}

class _RadialDragExampleState extends State<RadialDragExampleScreen> {

  bool isDragging = false;
  PolarCoord lastDragCoord;

  _onRadialDragStart(coord) {
    print('The user has started dragging radially at: $coord');
    setState(() {
      isDragging = true;
      lastDragCoord = coord;
    });
  }

  _onRadialDragUpdate(coord) {
    print('The user has dragged radially to: $coord');
    setState(() => lastDragCoord = coord);
  }

  _onRadialDragEnd() {
    print('The user has stopped dragging radially.');
    setState(() => isDragging = false);
  }

  _dragStatus() {
    if (isDragging) {
      return '$lastDragCoord';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
          width: double.INFINITY,
          padding: const EdgeInsets.all(15.0),
          color: Colors.grey,
          child: new Text(
            'Drag in the space below to see the radial drag status.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        new Expanded(
          child: new RadialDragGestureDetector(
            onRadialDragStart: _onRadialDragStart,
            onRadialDragUpdate: _onRadialDragUpdate,
            onRadialDragEnd: _onRadialDragEnd,
            child: new Center(
              child: new Container(
                color: Colors.white, // without a color the Container seems to collapse
                child: new Align(
                  alignment: Alignment.center,
                  child: new Text(
                    _dragStatus(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
