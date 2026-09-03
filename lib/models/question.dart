class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String? category;

  const Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    this.category,
  });
}
