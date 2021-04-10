import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/models/courses.dart';
import 'package:random_string/random_string.dart';

class MQuestion extends StatefulWidget {
  const MQuestion({Key key}) : super(key: key);
  @override
  _MQuestionState createState() => _MQuestionState();
}

class _MQuestionState extends State<MQuestion> {
  int _selectedIndex = 0;

  List<Widget> list = [
    AddQuestion(),
    UpdateQuestion(),
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
                    'Add Question',
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
                    'Update Question',
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

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  DataQuestions dataQuestions = new DataQuestions();
  final _formKey = GlobalKey<FormState>();
  String questionId,
      questionText,
      answer01,
      answer02,
      answer03,
      answer04,
      courseName;
  String imgURL = '';
  String _courseid;
  bool _isLoading = false;

  List CourseIdList = [];
  @override
  void initState() {
    super.initState();
    fecthIdCourseList();
    fecthNameCourseById();
  }

  fecthIdCourseList() async {
    dynamic resultant = await DataCourses().GetIdCourses();

    if (resultant == null) {
      print('Unable to get course');
    } else {
      setState(() {
        CourseIdList = resultant;
      });
    }
  }

  fecthNameCourseById() async {
    String resultant = await DataCourses().GetNameCourseById(_courseid);

    if (resultant == null) {
      print('Unable to get name');
    } else {
      setState(() {
        courseName = resultant;
      });
    }
  }

  addQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      questionId = randomAlphaNumeric(20);
      Map<String, String> questionMap = {
        'questionID': questionId,
        'questionText': questionText,
        'questionImgURL': imgURL,
        'answer01': answer01,
        'answer02': answer02,
        'answer03': answer03,
        'answer04': answer04,
      };

      dataQuestions.AddQuestion(questionMap, questionId, _courseid)
          .then((value) => {
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
                    DropDownField(
                      value: _courseid,
                      required: true,
                      strict: true,
                      labelText: 'Choose your course',
                      hintText: 'Course',
                      items: CourseIdList,
                      onValueChanged: (dynamic newId) {
                        _courseid = newId;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Question Text cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Question Text',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        questionText = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Answer01 cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Answer01 (Correct answer)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        answer01 = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Answer02 cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Answer02',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        answer02 = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Answer03 cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Answer03',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        answer03 = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "Answer04 cannot be empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Answer04',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onChanged: (val) {
                        answer04 = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Image URL',
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
                    FloatingActionButton(
                      onPressed: () => {
                        addQuestion(),
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

class UpdateQuestion extends StatefulWidget {
  @override
  _UpdateQuestionState createState() => _UpdateQuestionState();
}

class _UpdateQuestionState extends State<UpdateQuestion> {
  final _formKey = GlobalKey<FormState>();

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
                hintText: 'Find question with question text',
                labelText: 'Choose Question',
                items: country,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty
                      ? "Correct Answer cannot be empty"
                      : null;
                },
                decoration: InputDecoration(
                  labelText: 'Correct Answer',
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
                  return value.isEmpty ? "Answer01 cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Answer01',
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
                  return value.isEmpty ? "Answer02 cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Answer02',
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
                  return value.isEmpty ? "Answer03 cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Answer03',
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
                  return value.isEmpty ? "Answer04 cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Answer04',
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
