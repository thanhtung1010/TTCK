import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/views/Constants.dart';
import 'package:quizapp/views/home_page/components/course_body.dart';
import 'package:quizapp/views/home_page/components/info_body.dart';
import 'package:quizapp/views/home_page/components/manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _pageOption = [
    CourseBody(),
    InformationBody(),
    ManagerBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navigationColor,
      body: _pageOption[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        key: _bottomNavigationKey,
        height: 50,
        backgroundColor: navigationColor,
        items: <Widget>[
          Icon(
            Icons.apps,
            size: 30,
            color: Colors.grey[600],
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Colors.grey[600],
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.grey[600],
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
