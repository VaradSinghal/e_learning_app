import 'package:e_learning_app/models/quiz.dart';
import 'package:e_learning_app/models/quiz_attempt.dart';
import 'package:e_learning_app/views/quiz/quiz_result/quiz_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class QuizSubmitDialog extends StatelessWidget {
  final QuizAttempt attempt;
  final Quiz quiz;

  const QuizSubmitDialog({
    super.key,
    required this.attempt,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Quiz'),
      content: const Text('Are you sure you want to submit your answers?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            Get.off(() => QuizResultScreen(attempt: attempt, quiz: quiz));
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
