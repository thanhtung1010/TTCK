import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizapp/views/play_quiz/components/use_answer.dart';

final isTestMode = StateProvider((ref) => false);
final userAnswerSelected = StateProvider((ref) => new UserAnswer());
final userListAnswer = StateProvider((ref) => List<UserAnswer>());
final currentReadPage = StateProvider((ref) => 0);
