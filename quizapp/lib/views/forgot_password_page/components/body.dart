import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizapp/routes/authenticate.dart';
import 'package:quizapp/views/Constants.dart';
import 'package:quizapp/views/components/forgot_password.dart';
import 'package:quizapp/views/components/rounded_button.dart';
import 'package:quizapp/views/components/text_field_container.dart';
import 'package:quizapp/views/forgot_password_page/components/background.dart';
import 'package:quizapp/views/home_page/home_page.dart';
import 'package:quizapp/views/signin_page/signin_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

bool _passwordVisible = false;

void initState() {
  _passwordVisible = false;
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .signInEmailAndPassword(email, password)
          .then((value) => {
                if (value != null)
                  {
                    setState(() {
                      _isLoading = false;
                    }),
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()))
                  }
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Background(
            child: SingleChildScrollView(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFieldContainer(
                      child: TextFormField(
                    validator: (value) {
                      return value.isEmpty ? "Enter your email" : null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        )),
                  )),
                  TextFieldContainer(
                      child: TextFormField(
                    validator: (value) {
                      return value.isEmpty ? "Enter your name" : null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        )),
                  )),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (value) {
                        return value.isEmpty ? "Enter your password" : null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: !_passwordVisible,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      signUp();
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  ForgotPassword(
                    text: 'Already have account?',
                    press: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
