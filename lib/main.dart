import 'package:flutter/material.dart';

import 'start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF5433FF),
                Color(0xFF20BDFF),
                Color(0xFFA5FECB),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: const StartScreen()),
      ),
    ),
  );
}
