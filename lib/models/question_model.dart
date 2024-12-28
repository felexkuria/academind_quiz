class Question {
  final String questionText;

  final String questionExplanation;
  final List<String> answers;

  const Question({
    required this.questionText,
    required this.answers,
    required this.questionExplanation,
  });
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
