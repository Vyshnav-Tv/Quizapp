import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz, {super.key});
  final void Function() startquiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.jpeg',
            color: const Color.fromARGB(247, 31, 241, 59),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'learn flutter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: startquiz,
              icon: const Icon(Icons.arrow_circle_right_rounded),
              label: const Text(
                'start quiz',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
