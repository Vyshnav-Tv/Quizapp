import 'package:flutter/material.dart';
import 'package:quizapp/data/quizquestion.dart';
import 'package:quizapp/quetionscreen.dart';
import 'package:quizapp/resultscreen.dart';
import 'package:quizapp/startscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == quizquestions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = questions(
        OnSelectAnswer: chooseAnswer,
        onSelectAnswer: (String answer) {},
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenanswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 168, 72, 185)],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
