import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final int score;
  const CustomAppBar({
    super.key,
    this.score = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(
                18,
              ),
              child: Text(
                "Score $score",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
