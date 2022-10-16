import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?!',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Yellow', 'score': 2},
        {'text': 'Green', 'score': 7},
      ]
    },
    {
      'questionText': 'Don\'t you miss me ?!',
      'answers': [
        {'text': '0%', 'score': 0},
        {'text': '54%', 'score': 4},
        {'text': '23%', 'score': 2},
        {'text': '99%', 'score': 9},
      ]
    },
    {
      'questionText': 'what do u think of me?',
      'answers': [
        {'text': 'Good Person', 'score': 9},
        {'text': 'Bad Person', 'score': 1},
        {'text': 'Decent Guy', 'score': 7},
        {'text': 'Idc!!', 'score': 6},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questinos!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /**home: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/200w.gif"),
              fit: BoxFit.cover)),**/
      home: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestions: _answerQuestions,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
