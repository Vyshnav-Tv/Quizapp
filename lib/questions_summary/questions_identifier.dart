import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.isCorrectAnswer, required this.QuestionIndex});

  final int QuestionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final QuestionNumber = QuestionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.lightGreen : Colors.redAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        QuestionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}
