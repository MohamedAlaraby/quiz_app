import 'package:flutter/material.dart';

class AddNewQuesButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddNewQuesButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.plus_one),
    );
  }
}
