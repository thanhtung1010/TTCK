import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

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
                required: true,
                hintText: 'Find course with name',
                labelText: 'Choose course',
                items: country,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Question Text cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Question Text',
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

class UpdateQuestion extends StatefulWidget {
  @override
  _UpdateQuestionState createState() => _UpdateQuestionState();
}

class _UpdateQuestionState extends State<UpdateQuestion> {
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
