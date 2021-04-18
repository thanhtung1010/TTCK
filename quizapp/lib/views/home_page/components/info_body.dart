import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/routes/authentication_service.dart';
import 'package:quizapp/views/Constants.dart';

class InformationBody extends StatefulWidget {
  @override
  _InformationBodyState createState() => _InformationBodyState();
}

FirebaseAuth auth = FirebaseAuth.instance;
AuthenticationService _auth = new AuthenticationService(FirebaseAuth.instance);
getUSerInfo() async {
  Map<String, dynamic> userInfo;
  String uid = auth.currentUser.uid;
  dynamic resultan = _auth.GetUserById(uid);
  userInfo = resultan;
  print(userInfo);
}

class _InformationBodyState extends State<InformationBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink[50], navigationColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 1],
        ),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            RaisedButton(onPressed: () {
              context.read<AuthenticationService>().signOut();
            }),
            RaisedButton(
              onPressed: () {
                if (auth.currentUser != null) {
                  getUSerInfo();
                }
              },
              child: Text("Check use"),
            )
          ],
        ),
      ),
    );
  }
}
