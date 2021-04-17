import 'package:flutter/material.dart';
import 'package:quizapp/views/Constants.dart';
import 'package:quizapp/views/welcome_page/components/body.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Body(),
    );
  }
}
