import 'package:flutter/material.dart';

import '../Data/data.dart';

class ResultScreen extends StatefulWidget {
  final VoidCallback onRestart;
  final List<String> selectedAnswers;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.selectedAnswers,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // Get total questions from questions list
  // late final int numTotalQuestions;
  // int numCorrectQuestions = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize total questions count
  //   numTotalQuestions = questions.length;

  //   // Make sure we check all questions, not just selected answers
  //   for (var i = 0; i < numTotalQuestions; i++) {
  //     if (i < widget.selectedAnswers.length &&
  //         widget.selectedAnswers[i] == questions[i].answers[0]) {
  //       numCorrectQuestions++;
  //     }
  //   }
  // }

  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    // Use total questions count instead of selected answers length
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': i < widget.selectedAnswers.length
            ? widget.selectedAnswers[i]
            : 'Not answered',
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData().where((data) {
      return data['user_answer'] != 'Not answered' &&
          data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: summaryData().map((data) {
                            final isCorrect =
                                data['user_answer'] == data['correct_answer'];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: data['user_answer'] == 'Not answered'
                                    ? Colors.grey.withOpacity(0.1)
                                    : isCorrect
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: data['user_answer'] == 'Not answered'
                                      ? Colors.grey
                                      : isCorrect
                                          ? Colors.green
                                          : Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Question ${(data['question_index'] as int) + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          data['user_answer'] == 'Not answered'
                                              ? Colors.grey
                                              : isCorrect
                                                  ? Colors.green
                                                  : Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data['question'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Your answer: ${data['user_answer']}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Correct answer: ${data['correct_answer']}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: widget.onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.refresh, color: Colors.deepPurple),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
