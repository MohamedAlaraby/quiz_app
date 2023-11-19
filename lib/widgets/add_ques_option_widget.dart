import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class AddQuestionOption extends StatelessWidget {
  final TextEditingController optionController;
  final void Function(bool?)? onChange;
  final bool isOptionCorrect;

  final String hintText;

  const AddQuestionOption({
    super.key,
    required this.optionController,
    required this.onChange,
    required this.isOptionCorrect,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: optionController,
            hintText: hintText,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
          ),
          child: Checkbox(
            value: isOptionCorrect,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
