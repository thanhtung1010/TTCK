import 'package:flutter/cupertino.dart';
import 'package:quizapp/states/state_manager.dart';
import 'package:quizapp/views/play_quiz/components/use_answer.dart';
import '../question_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void setUserAnswer(
    BuildContext context, MapEntry<int, QuestionModel> e, value) {
  context.read(userListAnswer).state[e.key] =
      context.read(userAnswerSelected).state = new UserAnswer(
          questionId: e.value.questionID,
          answered: value,
          isCorrect: value.toString().isNotEmpty
              ? value.toString().toLowerCase() ==
                  e.value.correctAnswer.toLowerCase()
              : false);
}
