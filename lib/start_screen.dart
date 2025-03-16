import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  // startQuiz is a parameter comming from the quiz.dart which is switcScreen
  StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color:const Color.fromARGB(115, 255, 255, 255),
          ),
          SizedBox(height: 70),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 30), 
          OutlinedButton.icon(
            onPressed: () {startQuiz();},
            //onPressed: startQuiz, both are same
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 236, 233, 233),
              shape: BeveledRectangleBorder(),
            ),
            // icon:Icon(Icons.arrow_forward_sharp),
            label: Text('Start Quiz'),
            icon:Icon(Icons.arrow_forward_sharp, color:Colors.white),
            
          )
        ],
      )
    );
  }
}