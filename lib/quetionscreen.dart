import 'package:flutter/material.dart';
import 'package:quizapp/anwerebutton.dart';
import 'package:quizapp/data/quizquestion.dart';
import 'package:google_fonts/google_fonts.dart';

class questions extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const questions(
      {super.key,
      required this.OnSelectAnswer,
      required void Function(String answer) onSelectAnswer});
  // ignore: non_constant_identifier_names
  final void Function(String Answer) OnSelectAnswer;
  @override
  State<questions> createState() {
    return _questionsState();
  }
}

// ignore: camel_case_types
class _questionsState extends State<questions> {
  var currentQuestionIndex = 0;
  // ignore: non_constant_identifier_names
  void answerQuestion(String SelectedAnswer) {
    widget.OnSelectAnswer(SelectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = quizquestions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentquestion.getShuffledanswers().map((answer) {
              return Answerbutton(
                  answertext: answer,
                  ontap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
