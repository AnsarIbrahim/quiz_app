import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/mine.jpeg',
              width: 300,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Welcome to quiz app!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              // Add navigation to the next screen here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF5433FF),
              minimumSize: const Size(150, 50),
            ),
            icon: const Icon(Icons.arrow_right_alt_outlined, size: 30),
            label: const Text(
              'Start',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
