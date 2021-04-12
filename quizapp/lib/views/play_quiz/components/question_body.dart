import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizapp/states/state_manager.dart';
import 'package:quizapp/views/play_quiz/components/question_model.dart';
import 'package:quizapp/views/play_quiz/components/use_answer.dart';
import 'package:quizapp/views/play_quiz/components/utils/utils.dart';

class QuestionBody extends StatelessWidget {
  final BuildContext context;
  final List<UserAnswer> useAnswer;
  final CarouselController carouselController;
  final List<QuestionModel> question;
  QuestionBody({
    Key key,
    this.context,
    this.useAnswer,
    this.carouselController,
    this.question,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: question
          .asMap()
          .entries
          .map((e) => Builder(builder: (context) {
                return Consumer(
                  builder: (context, watch, _) {
                    var userAnswerState = watch(userAnswerSelected).state;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Q${e.key + 1}: ${e.value.questionText}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Visibility(
                                visible:
                                    e.value.questionImgURL != '' ? true : false,
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      15 *
                                      3,
                                  child: e.value.questionImgURL != ""
                                      ? Container()
                                      : Image.network(
                                          '${e.value.questionImgURL}',
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    '${e.value.answer01}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 'A',
                                    groupValue:
                                        getGroupValue(e, userAnswerState),
                                    onChanged: (value) => {
                                      setUserAnswer(context, e, value),
                                    },
                                  ),
                                ),
                              ), //AnswerA
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    '${e.value.answer02}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 'B',
                                    groupValue:
                                        getGroupValue(e, userAnswerState),
                                    onChanged: (value) => {
                                      setUserAnswer(context, e, value),
                                    },
                                  ),
                                ),
                              ), //AnswerB
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    '${e.value.answer03}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 'C',
                                    groupValue:
                                        getGroupValue(e, userAnswerState),
                                    onChanged: (value) => {
                                      setUserAnswer(context, e, value),
                                    },
                                  ),
                                ),
                              ), //AnswerC
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    '${e.value.answer04}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 'D',
                                    groupValue:
                                        getGroupValue(e, userAnswerState),
                                    onChanged: (value) => {
                                      setUserAnswer(context, e, value),
                                    },
                                  ),
                                ),
                              ), //AnswerD
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }))
          .toList(),
      options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          initialPage: 0,
          height: MediaQuery.of(context).size.height / 5 * 3,
          onPageChanged: (page, _) {
            context.read(currentReadPage).state = page;
          }),
    );
  }

  getGroupValue(MapEntry<int, QuestionModel> e, UserAnswer userAnswerState) {
    return context.read(isTestMode).state
        ? context.read(userListAnswer).state[e.key].answered
        : null;
  }
}
