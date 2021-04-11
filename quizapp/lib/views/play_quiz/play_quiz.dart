import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/views/play_quiz/components/question_model.dart';
import 'package:quizapp/views/play_quiz/components/quiz_play_widget.dart';
import 'package:quizapp/views/play_quiz/components/result.dart';

class PlayQuiz extends StatefulWidget {
  final String courseId;
  PlayQuiz(this.courseId);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  List QuestionList = [];
  List NewQuestionList = [];
  Random random = new Random();
  int randomNumber;
  String value;

  DataQuestions dataQuestions;

  QuestionModel getQuestionModelFromNewList(List NewQuestionList, int index) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.questionText = NewQuestionList[index]['questionText'];

    List<String> answers = [
      NewQuestionList[index]['answer01'],
      NewQuestionList[index]['answer02'],
      NewQuestionList[index]['answer03'],
      NewQuestionList[index]['answer04'],
    ];

    questionModel.correctAnswer = answers[0];

    answers.shuffle();

    questionModel.answer01 = answers[0];
    questionModel.answer02 = answers[1];
    questionModel.answer03 = answers[2];
    questionModel.answer04 = answers[3];
    questionModel.aswered = false;

    return questionModel;
  }

  @override
  void initState() {
    super.initState();
    fecth20QuestionList('${widget.courseId}');
    _correct = 0;
    _incorrect = 0;
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
    total = NewQuestionList.length;
    _notAttempted = NewQuestionList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NewQuestionList == null
          ? Container()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: NewQuestionList.length,
              itemBuilder: (context, index) {
                return QuizPlay(
                  questionModel:
                      getQuestionModelFromNewList(NewQuestionList, index),
                  index: index,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Result(
                  correct: _correct, incorrect: _incorrect, total: total),
            ),
          );
        },
      ),
    );
  }
}

class QuizPlay extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  QuizPlay({this.questionModel, this.index});
  @override
  _QuizPlayState createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {
  String optionSelected = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          'Q${widget.index + 1}: ${widget.questionModel.questionText}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.aswered) {
              if (widget.questionModel.answer01 ==
                  widget.questionModel.correctAnswer) {
                optionSelected = widget.questionModel.answer01;
                widget.questionModel.aswered = true;
                setState(() {
                  _correct += 1;
                  _notAttempted -= 1;
                });
              } else {
                optionSelected = widget.questionModel.answer01;
                widget.questionModel.aswered = true;
                setState(() {
                  _incorrect += 1;
                  _notAttempted -= 1;
                });
              }
            }
          },
          child: OptionTitle(
            option: 'A',
            optionSelected: optionSelected,
            correctAnswer: widget.questionModel.correctAnswer,
            description: widget.questionModel.answer01,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.aswered) {
              if (widget.questionModel.answer02 ==
                  widget.questionModel.correctAnswer) {
                optionSelected = widget.questionModel.answer02;
                widget.questionModel.aswered = true;
                setState(() {
                  _correct += 1;
                  _notAttempted -= 1;
                });
              } else {
                optionSelected = widget.questionModel.answer02;
                widget.questionModel.aswered = true;
                setState(() {
                  _incorrect += 1;
                  _notAttempted -= 1;
                });
              }
            }
          },
          child: OptionTitle(
            option: 'B',
            optionSelected: optionSelected,
            correctAnswer: widget.questionModel.correctAnswer,
            description: widget.questionModel.answer02,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.aswered) {
              if (widget.questionModel.answer03 ==
                  widget.questionModel.correctAnswer) {
                optionSelected = widget.questionModel.answer03;
                widget.questionModel.aswered = true;
                setState(() {
                  _correct += 1;
                  _notAttempted -= 1;
                });
              } else {
                optionSelected = widget.questionModel.answer03;
                widget.questionModel.aswered = true;
                setState(() {
                  _incorrect += 1;
                  _notAttempted -= 1;
                });
              }
            }
          },
          child: OptionTitle(
            option: 'C',
            optionSelected: optionSelected,
            correctAnswer: widget.questionModel.correctAnswer,
            description: widget.questionModel.answer03,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.aswered) {
              if (widget.questionModel.answer04 ==
                  widget.questionModel.correctAnswer) {
                optionSelected = widget.questionModel.answer04;
                widget.questionModel.aswered = true;
                setState(() {
                  _correct += 1;
                  _notAttempted -= 1;
                });
              } else {
                optionSelected = widget.questionModel.answer04;
                widget.questionModel.aswered = true;
                setState(() {
                  _incorrect += 1;
                  _notAttempted -= 1;
                });
              }
            }
          },
          child: OptionTitle(
            option: 'D',
            optionSelected: optionSelected,
            correctAnswer: widget.questionModel.correctAnswer,
            description: widget.questionModel.answer04,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }
}
