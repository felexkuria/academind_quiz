import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final VoidCallback switchScreen;

  const StartScreen({super.key, required this.switchScreen});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(99, 158, 158, 158),
        ),
        const SizedBox(height: 30),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: () {
            // Navigate to the next
            widget.switchScreen();
          },
          icon: const Icon(Icons.arrow_right_alt),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
