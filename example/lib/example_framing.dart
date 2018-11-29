import 'package:flutter/material.dart';
import 'package:fluttery/framing.dart';

class RandomColorBlockExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Bar
          new RandomColorBlock(
            width: double.INFINITY,
            height: 75.0,
            child: new Center(
              child: new Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: new Text(
                  'Random Block Color'
                ),
              ),
            ),
          ),

          // Square below top Bar
          new RandomColorBlock(
            width: double.INFINITY,
            child: new AspectRatio(
              aspectRatio: 1.0,
              child: new Center(
                child: new Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Colors.white,
                  child: new Text(
                    'Random colors live across hot reloads.'
                  ),
                ),
              ),
            ),
          ),

          // Bottom bar
          new Expanded(
            child: new RandomColorBlock(
              width: double.INFINITY,
            ),
          ),
        ],
      ),
    );
  }
}
