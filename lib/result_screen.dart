import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';
import 'questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < questions.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'chosenAnswer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 50,
          ),
          Text(
            'Quiz completed!',
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Here is the summary of your answers:',
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          QuestionsSummary(
            summaryData: getSummaryData(),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF5433FF),
              minimumSize: const Size(150, 50),
            ),
            child: Text(
              'Restart Quiz',
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
