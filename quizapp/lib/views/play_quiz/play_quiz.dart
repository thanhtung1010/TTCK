import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';

class PlayQuiz extends StatefulWidget {
  final String courseId;
  PlayQuiz(this.courseId);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  List QuestionIdList = [];
  List NewQuestionIdList = [];
  Random random = new Random();
  int randomNumber;
  String value;
  @override
  void initState() {
    super.initState();
    fecth20IdQuestionList('${widget.courseId}');
  }

  fecth20IdQuestionList(String id) async {
    dynamic resultant = await DataQuestions().GetIdQuestionList(id);

    if (resultant == null) {
      print('Unable to get question');
    } else {
      setState(() {
        QuestionIdList = resultant;
      });
    }
    while (NewQuestionIdList.length < 20) {
      randomNumber = random.nextInt(QuestionIdList.length);

      while (NewQuestionIdList.contains(QuestionIdList[randomNumber] == true)) {
        randomNumber = random.nextInt(QuestionIdList.length);
      }
      setState(() {
        NewQuestionIdList.add(QuestionIdList[randomNumber]);
      });
    }
    print(NewQuestionIdList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Text('Play quiz'),
    );
  }
}
