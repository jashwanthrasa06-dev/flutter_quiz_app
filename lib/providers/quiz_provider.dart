import 'package:flutter/foundation.dart';
import '../data/questions_data.dart';
import '../models/question.dart';

/// Central state holder for an in-progress (or finished) quiz attempt.
/// Exposed via [ChangeNotifierProvider] and consumed by the quiz/result
/// screens through [Consumer] / [context.watch].
class QuizProvider extends ChangeNotifier {
  final List<Question> _questions = quizQuestions;

  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;
  bool _answered = false;

  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int? get selectedOptionIndex => _selectedOptionIndex;
  bool get answered => _answered;
  int get totalQuestions => _questions.length;
  bool get isLastQuestion => _currentIndex == _questions.length - 1;
  bool get isQuizComplete => _currentIndex >= _questions.length;

  Question get currentQuestion => _questions[_currentIndex];

  /// Records the user's answer choice for the current question.
  /// Locks further selection until [nextQuestion] is called.
  void selectAnswer(int optionIndex) {
    if (_answered) return; // prevent double-scoring on re-tap

    _selectedOptionIndex = optionIndex;
    _answered = true;

    if (optionIndex == currentQuestion.correctIndex) {
      _score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedOptionIndex = null;
      _answered = false;
      notifyListeners();
    } else {
      // Signal completion; the UI navigates to the results screen.
      _currentIndex++;
      notifyListeners();
    }
  }

  void restart() {
    _currentIndex = 0;
    _score = 0;
    _selectedOptionIndex = null;
    _answered = false;
    notifyListeners();
  }

  double get scorePercentage =>
      _questions.isEmpty ? 0 : (_score / _questions.length) * 100;
}
