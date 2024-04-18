class QuizQuestions {
  const QuizQuestions(this.text, this.answeres);
  final String text;
  final List<String> answeres;
  List<String> getShuffledanswers() {
    final shuffledList = List.of(answeres);
    shuffledList.shuffle();
    return shuffledList;
  }
}
