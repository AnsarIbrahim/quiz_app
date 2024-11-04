import 'package:quiz_app/data/questions.dart';

class Questions {
  final String question;
  final List<String> answers;

  Questions({
    required this.question,
    required this.answers,
  });

  static List<Questions> getQuestions() {
    return questions;
  }

  List<String> getShuffledAnswers() {
    final shuffledAnswers = answers.toList()..shuffle();
    return shuffledAnswers;
  }
}
