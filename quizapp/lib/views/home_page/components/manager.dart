import 'package:flutter/material.dart';
import 'package:quizapp/views/Constants.dart';

class ManagerBody extends StatefulWidget {
  @override
  _ManagerBodyState createState() => _ManagerBodyState();
}

class _ManagerBodyState extends State<ManagerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryLightColor, navigationColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 1],
        ),
      ),
    );
  }
}
