import 'package:flutter/material.dart';

void showSnakeBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
