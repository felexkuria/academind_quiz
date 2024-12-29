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
  var activeScreen = "start-screen";
  final List<Question> queries = questions;

  var selectedIndex = 0;

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void nextQuestion() {
    if (selectedIndex >= queries.length - 1) {
      setState(() {
        activeScreen = "start-screen";
        selectedIndex = 0;
      });
      return;
    }
    setState(() {
      selectedIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      selectedIndex = 0;
      queries.shuffle();
      activeScreen = "start-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = queries[selectedIndex];

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
      child: activeScreen == "start-screen"
          ? StartScreen(switchScreen: switchScreen)
          : QuestionScreen(nextQuery: nextQuestion, question: currentQuestions),
    )));
  }
}
