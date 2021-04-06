import 'package:cloud_firestore/cloud_firestore.dart';

class DataCourses {
  final CollectionReference courseList =
      FirebaseFirestore.instance.collection('Couses');

  Future<void> AddCourses(Map courseData, String courseId) async {
    await FirebaseFirestore.instance
        .collection('Couses')
        .doc(courseId)
        .set(courseData)
        .catchError((e) {
      if (!e) {
        print('add course success');
      } else {
        print(e.toString());
      }
    });
  }

  Future GetCourseList() async {
    List CourseList = [];

    try {
      await courseList.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              CourseList.add(element.data());
            }),
          });
      return CourseList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future GetCourseListWithIdAndName() async {
    List IdAndNameList = [];

    try {
      await courseList.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              IdAndNameList.add(element.data());
            }),
          });
      return IdAndNameList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
