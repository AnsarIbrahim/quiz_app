import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.question,
              style: GoogleFonts.aBeeZee(
                color: const Color.fromARGB(255, 196, 225, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestions.getShuffledAnswers().map(
              (answer) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    AnswerButton(
                      answerText: answer,
                      onTap: () => nextQuestion(answer),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
