import 'package:flutter/material.dart';
import 'package:quizapp/views/Constants.dart';

class CourseBody extends StatefulWidget {
  @override
  _CourseBodyState createState() => _CourseBodyState();
}

class _CourseBodyState extends State<CourseBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStartColor, navigationColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.7],
        ),
      ),
    );
  }
}
