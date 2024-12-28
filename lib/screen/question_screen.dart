import 'package:academind_quiz/Data/data.dart';
import 'package:academind_quiz/models/question_model.dart';
import 'package:academind_quiz/widgets/answer_widget.dart';
import 'package:academind_quiz/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Question> qauestions = questions;
  var selectedIndex = 0;

  void nextQuestion() {
    setState(() {
      selectedIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      selectedIndex = 0;
      qauestions.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = qauestions[selectedIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        QuestionWidget(
          question: currentQuestion.questionText,
        ),
        ...currentQuestion.getShuffledAnswers().map((question) => AnswerWidget(
              answer: question,
              onPressed: () {
                nextQuestion();
              },
            ))
      ],
    );
  }
}
