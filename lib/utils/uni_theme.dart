import 'package:flutter/material.dart';

class UniTheme {
  static const BoxDecoration normalGradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.black,
        Colors.blueAccent,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const BoxDecoration circularGradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.blueAccent,
        Colors.black,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    shape: BoxShape.circle,
  );
}
