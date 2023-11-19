import 'package:flutter/material.dart';

void showSnakeBar(context, String text, {color=Colors.green}) {
 
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
