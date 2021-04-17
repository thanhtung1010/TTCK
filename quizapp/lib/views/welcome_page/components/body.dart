import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/views/Constants.dart';
import 'package:quizapp/views/components/rounded_button.dart';
import 'package:quizapp/views/introduce%20_page/introduce_page.dart';
import 'package:quizapp/views/signin_page/signin_page.dart';
import 'package:quizapp/views/welcome_page/components/background.dart';
import 'package:quizapp/views/welcome_page/components/slide_show.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            SlideShow(),
            RoundedButton(
              text: 'MORE INF',
              color: Colors.white,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return IntroducePage();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignInPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
