import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// コードスニペット control + space
// フォーマット option + f
// リファクター option + r

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': '好きな色は?',
      'answers': [
        {'text': '黒', 'score': 10},
        {'text': '赤', 'score': 5},
        {'text': '緑', 'score': 3},
        {'text': '白', 'score': 1},
      ],
    },
    {
      'questionText': '好きな動物は?',
      'answers': [
        {'text': 'うさぎ', 'score': 10},
        {'text': 'へび', 'score': 5},
        {'text': 'ぞう', 'score': 3},
        {'text': 'らいおん', 'score': 1},
      ],
    },
    {
      'questionText': '好きな食べ物は?',
      'answers': [
        {'text': 'りんご', 'score': 10},
        {'text': 'メロン', 'score': 5},
        {'text': 'いちご', 'score': 3},
        {'text': 'すいか', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('We don\'t have questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
