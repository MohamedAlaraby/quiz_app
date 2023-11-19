import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/quiz_model.dart';

class DBConnect {
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
  }

  Future<List<QuizModel>> fetchGenQuestion() async {
    List<QuizModel> questions = [];
    http.Response response = await http.get(url);
    try {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
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
      return questions;
    } catch (error) {
      throw Exception(error.toString);
    }
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('User not found');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (e) {
      throw Exception('Wrong password provided for that user.');
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
