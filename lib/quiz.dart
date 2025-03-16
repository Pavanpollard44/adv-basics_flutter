import 'package:adv_basics/questions_screen/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/result_screen/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key}); 
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers = [];
  //? indicate activeScreen can also be null
  Widget ? activeScreen ;

  //this method is to store the selected answers in to selectedAnswers list when user selects answers
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    // To Stop moving to the next question once the selected answers lits equals to the length of questions
    if(selectedAnswers.length == questions.length){
      // print('i called....${selectedAnswers} ');
      setState(() {
        activeScreen = ResultScreen(choseAnswer: selectedAnswers,onRestart: restartQuiz);
      });
    } 
  }

  // initState will run only once when the object state is created for the first time
  // initState(): Executed by Flutter when the StatefulWidget's State object is initialized
  @override
  void initState() {
    activeScreen = StartScreen(startQuiz);
    super.initState();
  }

  //This methode execute when user clicks on start quiz button
  void startQuiz() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer); 
    }); 
  }
  
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  // build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
  Widget build(context) {
    return(
      MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 29, 5, 33), Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
            child: activeScreen
          )
        ),
      )
    );
  }
}