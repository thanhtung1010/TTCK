import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataQuestions {
  Future<void> AddQuestion(
      Map questionData, String questionId, String courseId) async {
    await FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .collection('Questions')
        .doc(questionId)
        .set(questionData)
        .catchError((e) {
      if (!e) {
        print('add course success');
      } else {
        print(e.toString());
      }
    });
  }

  Future GetLimitIdQuestionList(String courseId) async {
    final CollectionReference questionIdLimitList = FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .collection('Questions');
    List QuestionList = [];

    try {
      await questionIdLimitList
          .orderBy('questionID')
          .limit(20)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((element) {
                  QuestionList.add(element.get('questionID'));
                }),
              });
      return QuestionList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getLimitQuestionData(String courseId) async {
    List QuestionLimitList = [];
    final CollectionReference questionLimitList = FirebaseFirestore.instance
        .collection("Couses")
        .doc(courseId)
        .collection("Questions");

    try {
      await questionLimitList.limit(20).get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              QuestionLimitList.add(element.data());
            }),
          });
      return QuestionLimitList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getQuestionData(String courseId) async {
    List QuestionList = [];
    final CollectionReference questionList = FirebaseFirestore.instance
        .collection("Couses")
        .doc(courseId)
        .collection("Questions");

    try {
      await questionList.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              QuestionList.add(element.data());
            }),
          });
      return QuestionList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  getQuestionData02(String courseId) async {
    return await FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .collection('Questions')
        .get();
  }

  Future GetIdQuestionList(String courseId) async {
    final CollectionReference questionLimitList = FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .collection('Questions');
    List QuestionList = [];

    try {
      await questionLimitList
          .orderBy('questionID')
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((element) {
                  QuestionList.add(element.get('questionID'));
                }),
              });
      return QuestionList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  GetQuestionById(String questionId) {}
}
