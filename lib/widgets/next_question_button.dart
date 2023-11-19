import 'package:flutter/material.dart';

class NextQuestionWidget extends StatelessWidget {
  const NextQuestionWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        label: const Text(
          "Next Question",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
