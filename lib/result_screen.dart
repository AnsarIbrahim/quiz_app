import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';
import 'questions_summary.dart';
import 'quiz.dart';

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
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['correctAnswer'] == data['chosenAnswer'])
        .length;

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
          Text.rich(
            TextSpan(
              text: 'Total Questions: ',
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: '$numTotalQuestions',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: ', Correct Answers: ',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: '$numCorrectAnswers',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: QuestionsSummary(
              summaryData: summaryData,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Quiz()),
              );
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
