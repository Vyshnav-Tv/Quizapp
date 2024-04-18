import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(
      {super.key, required this.answertext, required this.ontap});
  final String answertext;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            )),
        child: Text(answertext));
  }
}
