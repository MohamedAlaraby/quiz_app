import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ScoreDialog extends StatelessWidget {
  final int finalScore;
  final int questionsLength;
  final VoidCallback onPressed;
  const ScoreDialog({
    super.key,
    required this.finalScore,
    required this.questionsLength,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackground,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Final Score \n ",
              style: TextStyle(
                color: kNeutral,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              minRadius: 50,
              backgroundColor: getCircleAvatarBackground(),
              child: Text(
                "$finalScore / $questionsLength",
                style: const TextStyle(
                  color: kNeutral,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              finalScore >= questionsLength / 2
                  ? "Congratulation"
                  : "Try Again!",
              style: const TextStyle(
                color: kNeutral,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "Start Over",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getCircleAvatarBackground() {
    return finalScore >= questionsLength / 2 ? kCorrect : kIncorrect;
  }
}
