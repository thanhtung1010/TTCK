import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/views/play_quiz/components/question_model.dart';
import 'package:quizapp/views/play_quiz/components/quiz_play_widget.dart';

class PlayQuiz extends StatefulWidget {
  final String courseId;
  PlayQuiz(this.courseId);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int _corect = 0;
int _incorect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  List QuestionList = [];
  List NewQuestionList = [];
  Random random = new Random();
  int randomNumber;
  String value;
  @override
  void initState() {
    super.initState();
    fecth20QuestionList('${widget.courseId}');
    int _corect = 0;
    int _incorect = 0;
    int _notAttempted = 0;
    int total = NewQuestionList.length;
  }

  fecth20QuestionList(String id) async {
    dynamic resultant = await DataQuestions().getQuestionData(id);

    if (resultant == null) {
      print('Unable to get question');
    } else {
      setState(() {
        QuestionList = resultant;
      });
    }
    while (NewQuestionList.length < 20) {
      randomNumber = random.nextInt(QuestionList.length);

      while (NewQuestionList.contains(QuestionList[randomNumber] == true)) {
        randomNumber = random.nextInt(QuestionList.length);
      }
      setState(() {
        NewQuestionList.add(QuestionList[randomNumber]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewQuestionList == null
              ? Container()
              : ListView.builder(
                  itemCount: NewQuestionList.length,
                  itemBuilder: (context, index) {
                    return QuizPlay();
                  },
                )
        ],
      ),
    );
  }
}

class QuizPlay extends StatefulWidget {
  final QuestionModel questionModel;
  QuizPlay({this.questionModel});
  @override
  _QuizPlayState createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {
  String questionSelected = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.questionModel.questionText),
          OptionTitle(
            option: 'A',
            optionSelected: questionSelected,
            correctAnswer: widget.questionModel.answer01,
            description: widget.questionModel.answer01,
          ),
          OptionTitle(
            option: 'B',
            optionSelected: questionSelected,
            correctAnswer: widget.questionModel.answer01,
            description: widget.questionModel.answer02,
          ),
          OptionTitle(
            option: 'C',
            optionSelected: questionSelected,
            correctAnswer: widget.questionModel.answer01,
            description: widget.questionModel.answer03,
          ),
          OptionTitle(
            option: 'D',
            optionSelected: questionSelected,
            correctAnswer: widget.questionModel.answer01,
            description: widget.questionModel.answer04,
          ),
        ],
      ),
    );
  }
}
