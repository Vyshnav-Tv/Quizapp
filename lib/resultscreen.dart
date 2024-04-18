import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/quizquestion.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenanswer, required this.onRestart});

  final List<String> chosenanswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenanswer.length; i++) {
      summary.add(
        {
          'question_index': 1,
          'question': quizquestions[i].text,
          'correct_answer': quizquestions[i].answeres[0],
          'user_answer': chosenanswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    int numTotalQuestions = quizquestions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numCorrectAnswer  outof $numTotalQuestions correctly!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restore),
              label: const Text('Restart quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
