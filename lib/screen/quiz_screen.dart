import 'package:academind_quiz/Data/data.dart';
import 'package:academind_quiz/models/question_model.dart';
import 'package:academind_quiz/screen/question_screen.dart';
import 'package:academind_quiz/screen/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // This line declares a class-level variable 'activeScreen' of type Widget that can be null (indicated by ?)
  // It will be used to store and manage which screen is currently being displayed in the app
  // The Widget type means it can hold any Flutter UI component
  Widget? activeScreen;
  final List<Question> queries = questions;

  // This method is called when the stateful widget is first created
  // It initializes the 'activeScreen' variable with the StartScreen widget
  @override
  void initState() {
    activeScreen = StartScreen(
      switchScreen: switchScreen,
    );
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: activeScreen,
    )));
  }
}
