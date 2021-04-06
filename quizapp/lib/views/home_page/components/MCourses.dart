import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/models/courses.dart';
import 'package:random_string/random_string.dart';

class MCourses extends StatefulWidget {
  const MCourses({Key key}) : super(key: key);
  @override
  _MCoursesState createState() => _MCoursesState();
}

class _MCoursesState extends State<MCourses> {
  int _selectedIndex = 0;

  List<Widget> list = [
    AddCourses(),
    DeleteCourses(),
    UpdateCourses(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NavigationRail(
              onDestinationSelected: (int index) => {
                setState(() => {_selectedIndex = index})
              },
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add_circle_outline),
                  ),
                  selectedIcon: Icon(Icons.add_circle_outline),
                  label: Text(
                    'Add Courses',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.do_disturb_on_outlined),
                  ),
                  selectedIcon: Icon(Icons.do_disturb_on_outlined),
                  label: Text(
                    'Delete Courses',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.system_update_alt_outlined),
                  ),
                  selectedIcon: Icon(Icons.system_update_alt_outlined),
                  label: Text(
                    'Update Courses',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ],
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.selected,
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: list[_selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}

class AddCourses extends StatefulWidget {
  @override
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final _formKey = GlobalKey<FormState>();
  String courseName, courseDes, imgURL, courseId;
  DataCourses dataCourses = new DataCourses();

  bool _isLoading = false;

  createCourses() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      courseId = randomAlphaNumeric(20);
      Map<String, String> coursesMap = {
        "courseId": courseId,
        "courseName": courseName,
        "courseDes": courseDes,
        "imgURL": imgURL,
      };

      await dataCourses.AddCourses(coursesMap, courseId).then((value) => {
            setState(() {
              _isLoading = false;
            })
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 5.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Name Courses cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name Courses',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        courseName = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Description Courses cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        courseDes = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Course image URL cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Course image URL',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        imgURL = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    FloatingActionButton(
                      onPressed: () => {
                        createCourses(),
                      },
                      child: Icon(Icons.done),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class DeleteCourses extends StatefulWidget {
  @override
  _DeleteCoursesState createState() => _DeleteCoursesState();
}

class _DeleteCoursesState extends State<DeleteCourses> {
  String _myActivity;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }

  String country_id;
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 5.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropDownField(
                onValueChanged: (dynamic value) {
                  country_id = value;
                },
                value: country_id,
                required: false,
                hintText: 'Find course with name',
                labelText: 'Courses',
                items: country,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              FloatingActionButton(
                onPressed: () => {
                  _formKey.currentState.validate(),
                },
                child: Icon(Icons.done),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateCourses extends StatefulWidget {
  @override
  _UpdateCoursesState createState() => _UpdateCoursesState();
}

class _UpdateCoursesState extends State<UpdateCourses> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 5.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Name Courses cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Name Courses',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Description Courses cannot be empty"
                      : null;
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Courser image URL cannot be empty"
                      : null;
                },
                decoration: InputDecoration(
                  labelText: 'Courser image URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              FloatingActionButton(
                onPressed: () => {
                  _formKey.currentState.validate(),
                },
                child: Icon(Icons.done),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
