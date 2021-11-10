import 'package:flutter/material.dart';
import 'package:flutter_flurry_drawer/flutter_flurry_drawer.dart';

final Screen Lab6BonusScreen = Screen(contentBuilder: (BuildContext context) {
  return Center(
    child: Container(
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: const [
            Expanded(child: Center(child: Text('In Progress ...')))
          ],
        ),
      ),
    ),
  );
});
