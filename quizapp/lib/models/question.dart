import 'package:cloud_firestore/cloud_firestore.dart';

class DataQuestions {
  Future<void> AddQuestion(Map questionData, String courseId) async {
    await FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .collection('Questions')
        .add(questionData)
        .catchError((e) {
      if (!e) {
        print('add course success');
      } else {
        print(e.toString());
      }
    });
  }
}
