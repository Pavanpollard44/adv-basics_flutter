import 'package:flutter/material.dart';
import 'package:adv_basics/questions_screen/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,  required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;


  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
    currentQuestionIndex = currentQuestionIndex + 1;
    });
  }
      

  @override
  Widget build(context){
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      // width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style:GoogleFonts.lato(
                color: const Color.fromARGB(255, 166, 145, 228),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign:TextAlign.center,
            ),
            SizedBox(height:30),
            // here we used spread operator(...) because map will retuen a list but we needed a widget
            ...currentQuestion.getShuffledAnswers().map((answer) {  
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                }
              ); 
            })  
          ],
        ),
      ),
    );
  }
}