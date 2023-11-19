import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.indexAction,
    required this.totalQuestion,
  });
  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Text(
        'Q (${indexAction + 1}/$totalQuestion): $question',
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
