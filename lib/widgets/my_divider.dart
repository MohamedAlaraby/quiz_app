import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 2,
      color: kNeutral,
      indent: 20,
      endIndent: 20,
    );
  }
}
