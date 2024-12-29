import 'package:academind_quiz/Data/data.dart';
import 'package:academind_quiz/models/question_model.dart';
import 'package:academind_quiz/screen/question_screen.dart';
import 'package:academind_quiz/screen/result_screen.dart';
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
  final List<String> userAnswers = [];

  var selectedIndex = 0;

  void switchScreen() {
    if (selectedIndex > queries.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void nextQuestion(String answer) {
    if (selectedIndex >= queries.length - 1) {
      setState(() {
        activeScreen = "result-screen";
        selectedIndex = 0;
      });
      return;
    }
    choosenAnswer(answer);
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

  void choosenAnswer(String answer) {
    userAnswers.add(answer);
    // print(answer);
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
      child: activeScreen == 'start-screen'
          ? StartScreen(switchScreen: switchScreen)
          : activeScreen == "question-screen"
              ? QuestionScreen(
                  question: currentQuestions,
                  nextQuery: nextQuestion,
                  //  selectedIndex: selectedIndex,
                  //  totalQuestions: queries.length,
                )
              : ResultScreen(
                  onRestart: restartQuiz, selectedAnswers: userAnswers,
                  // totalQuestions: queries.length,
                ),
    )));
  }
}
