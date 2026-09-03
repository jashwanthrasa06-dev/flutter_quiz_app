import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_button.dart';
import '../widgets/progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, _) {
        if (quiz.isQuizComplete) {
          // Defer navigation until after this frame finishes building.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ResultScreen()),
            );
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final question = quiz.currentQuestion;

        return Scaffold(
          appBar: AppBar(
            title: Text(question.category ?? 'Quiz'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    'Score: ${quiz.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuizProgressBar(
                    current: quiz.currentIndex + 1,
                    total: quiz.totalQuestions,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    question.questionText,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        return AnswerButton(
                          optionText: question.options[index],
                          optionIndex: index,
                          selectedIndex: quiz.selectedOptionIndex,
                          correctIndex: question.correctIndex,
                          answered: quiz.answered,
                          onTap: () => quiz.selectAnswer(index),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: quiz.answered
                          ? () => quiz.nextQuestion()
                          : null,
                      child: Text(
                        quiz.isLastQuestion ? 'See Results' : 'Next Question',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
