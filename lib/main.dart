import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
// to know what to encapsulate, ask yourself what should be hidden from the user
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Quizzer(),
    );
  }
}

class Quizzer extends StatefulWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  State<Quizzer> createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  // Question q1 = Question(q: "The human body has 89 tissues", a: false);
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userCheckedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        //a package rFlutter
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
        //  resets the scoreKeeper and makes it zero.
      }
      //if it hasn't gotten to the end of the game, then continue to check the
      // grades
      else {
        if (correctAnswer == userCheckedAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  // quizBrain.questionBank[questionNumber].questionText,
                  //the above doesn't work after encapsulation, since question
                  //bank is now private
                  quizBrain.getQuestionText(),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 120,
                      //   vertical: 25,
                      // ),
                      width: double.infinity,
                      height: 70,
                      child: Center(
                          child: Text(
                        "True",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      color: Colors.green,
                    ))),
            Expanded(
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 120,
                  //   vertical: 25,                    ),
                  child: Center(
                      child: Text(
                    "False",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  color: Colors.red,
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
