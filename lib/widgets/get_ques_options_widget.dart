import 'package:flutter/material.dart';
class OptionsWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const OptionsWidget({
    super.key,
    required this.option,
    required this.color,
    required this.onPressed,
  });
  final String option;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          color: color,
          child: ListTile(
            title: Text(
              option,
              style: TextStyle(
                fontSize: 22,
                //We will assign the text color upon the color of the back ground.
                //Here we check on the ratio of the red and green color in the color variable.
                color: color.red != color.green ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
