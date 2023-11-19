import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/utils/helper_methods.dart';
import 'package:quiz_app/manage/edit_question_cubit/edit_question_cubit.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/widgets/add_ques_option_widget.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class EditQuestionScreen extends StatefulWidget {
  final QuizModel question;
  const EditQuestionScreen({
    required this.question,
    super.key,
  });

  @override
  EditQuestionScreenState createState() => EditQuestionScreenState();
}

class EditQuestionScreenState extends State<EditQuestionScreen> {
  // Controller for the question text field
  final TextEditingController _questionController = TextEditingController();

  // Controllers for the option text fields
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();

  // Variables to track the correct option
  bool _isOption1Correct = false;
  bool _isOption2Correct = false;
  bool _isOption3Correct = false;
  bool _isOption4Correct = false;
  List<bool> checkBoxsStatus = [];
  List<String> optionsText = [];
  @override
  void initState() {
    _questionController.text = widget.question.title;
    widget.question.options.forEach((key, value) {
      checkBoxsStatus.add(value);
      optionsText.add(key);
    });
    fillFields();

    super.initState();
  }

  void fillFields() {
    _option1Controller.text = optionsText[0];
    _option2Controller.text = optionsText[1];
    _option3Controller.text = optionsText[2];
    _option4Controller.text = optionsText[3];

    _isOption1Correct = checkBoxsStatus[0];
    _isOption2Correct = checkBoxsStatus[1];
    _isOption3Correct = checkBoxsStatus[2];
    _isOption4Correct = checkBoxsStatus[3];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              hintText: 'Enter Question',
              controller: _questionController,
            ),
            const SizedBox(height: 20.0),
            AddQuestionOption(
              hintText: 'Option1',
              isOptionCorrect: _isOption1Correct,
              optionController: _option1Controller,
              onChange: (value) {
                setState(() {
                  _isOption1Correct = value!;
                  // Uncheck the other options if this is checked
                  if (_isOption1Correct) {
                    _isOption2Correct = false;
                    _isOption3Correct = false;
                    _isOption4Correct = false;
                  }
                });
              },
            ),
            const SizedBox(height: 8.0),
            AddQuestionOption(
              hintText: 'Option2',
              optionController: _option2Controller,
              isOptionCorrect: _isOption2Correct,
              onChange: (value) {
                setState(() {
                  _isOption2Correct = value!;
                  // Uncheck the other options if this is checked
                  if (_isOption2Correct) {
                    _isOption1Correct = false;
                    _isOption3Correct = false;
                    _isOption4Correct = false;
                  }
                });
              },
            ),
            const SizedBox(height: 8.0),
            AddQuestionOption(
              hintText: 'Option3',
              optionController: _option3Controller,
              isOptionCorrect: _isOption3Correct,
              onChange: (value) {
                setState(() {
                  _isOption3Correct = value!;
                  // Uncheck the other options if this is checked
                  if (_isOption3Correct) {
                    _isOption1Correct = false;
                    _isOption2Correct = false;
                    _isOption4Correct = false;
                  }
                });
              },
            ),
            const SizedBox(height: 8.0),
            AddQuestionOption(
              hintText: 'Option4',
              optionController: _option4Controller,
              isOptionCorrect: _isOption4Correct,
              onChange: (value) {
                setState(() {
                  _isOption4Correct = value!;
                  // Uncheck the other options if this is checked
                  if (_isOption4Correct) {
                    _isOption1Correct = false;
                    _isOption2Correct = false;
                    _isOption3Correct = false;
                  }
                });
              },
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: () async {
                QuizModel quizModel = QuizModel(
                  id: widget.question.id,
                  title: _questionController.text,
                  options: {
                    _option1Controller.text: _isOption1Correct,
                    _option2Controller.text: _isOption2Correct,
                    _option3Controller.text: _isOption3Correct,
                    _option4Controller.text: _isOption4Correct,
                  },
                );

                BlocProvider.of<EditQuestionCubit>(context)
                    .editQuestion(quizModel: quizModel)
                    .then(
                  (value) {
                    showSnakeBar(context, "Question Edited successfully");
                  },
                );
              },
              text: 'Edit',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _option1Controller.dispose();
    _option2Controller.dispose();
    _option3Controller.dispose();
    _option4Controller.dispose();
  }
}
