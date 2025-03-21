class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    //we are not using List.of(answers).shuffle() because .shuffle() will return null
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
    
  }
}