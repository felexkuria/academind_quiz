import 'package:academind_quiz/models/question_model.dart';
import 'package:academind_quiz/widgets/answer_widget.dart';
import 'package:academind_quiz/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.nextQuery,
    required this.question,
  });
  final void Function(String answer) nextQuery;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        QuestionWidget(
          question: question.questionText,
        ),
        ...question.getShuffledAnswers().map((answer) => AnswerWidget(
              answer: answer,
              onPressed: () {
                nextQuery(answer);
              },
            ))
      ],
    );
  }
}
