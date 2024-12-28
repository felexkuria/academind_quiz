import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key, required this.title});

  String title = 'Start Screen';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Image.asset('assets/images/quiz-logo.png', width: 300),
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
            // Navigate to the next screen
            Navigator.pushNamed(context, '/questions');
          },
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
