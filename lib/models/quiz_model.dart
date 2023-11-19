// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  final String? id;
  final String title;
  final Map<String, bool> options;

  QuizModel({
    this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() => 'QuizModel(id: $id, title: $title, options: $options)';
}
