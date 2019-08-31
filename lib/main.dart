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
      'answers': ['黒', '赤', '緑', '白'],
    },
    {
      'questionText': '好きな動物は?',
      'answers': ['うさぎ', 'へび', 'ぞう', 'らいおん'],
    },
    {
      'questionText': '好きな食べ物は?',
      'answers': ['りんご', 'メロン', 'いちご', 'すいか'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
