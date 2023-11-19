import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/widgets/question_widget.dart';

class DBConnect {
  final String baseUrl = "";

  var url = Uri.parse(
      "https://quiz-app-50bcb-default-rtdb.firebaseio.com/genQuestions.json");

  Future<void> addGenQuestion(QuizModel model) async {
    await http.post(
      url,
      body: jsonEncode(
        {
          'title': model.title,
          'options': model.options,
        },
      ),
    );
  }

  Future<void> updateGenQuestion(QuizModel model) async {
    var url = Uri.parse(
        "https://quiz-app-50bcb-default-rtdb.firebaseio.com/genQuestions/${model.id}.json");
    await http.patch(
      url,
      body: jsonEncode(
        {
          'title': model.title,
          'options': model.options,
        },
      ),
    );
    print("updated successfully");
  }

  Future<List<QuizModel>> fetchGenQuestion() async {
    List<QuizModel> questions = [];
    try {
      http.Response reponse = await http.get(url);
      var data = jsonDecode(reponse.body) as Map<String, dynamic>;
      data.forEach(
        (key, value) {
          questions.add(
            QuizModel(
              id: key,
              title: value["title"],
              //This cast method will convert the map<string,dynamic> to Map<string,bool>
              options: Map.castFrom(value["options"]),
            ),
          );
        },
      );
      print(questions);
      return questions;
    } catch (error) {
      throw Exception("Error is $error");
    }
  }
}
