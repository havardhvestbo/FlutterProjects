import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 255, 0, 221),
          Color.fromARGB(255, 155, 11, 217),
        ),
      ),
    ),
  );
}