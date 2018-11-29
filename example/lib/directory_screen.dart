import 'package:flutter/material.dart';

class DirectoryScreen extends StatelessWidget {

  static final examples = [
    {
      'title': 'Random Color Block',
      'route': '/randomColorBlock',
    },
    {
      'title': 'Radial Gesture Detetor',
      'route': '/radialDrag',
    },
    {
      'title': 'Animation Player',
      'route': '/animationPlayer',
    }
  ];

  @override
  Widget build(BuildContext context) {

    final listItems = examples.map((example) {
      return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new RaisedButton(
          child: new Text(
            '${example["title"]}'
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(example['route']);
          },
        ),
      );
    }).toList();

    return new ListView(
      children: listItems,
    );
  }
}
