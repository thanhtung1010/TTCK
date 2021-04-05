import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class MUser extends StatefulWidget {
  const MUser({Key key}) : super(key: key);

  @override
  _MUserState createState() => _MUserState();
}

class _MUserState extends State<MUser> {
  int _selectedIndex = 0;

  List<Widget> list = [
    AddUser(),
    DeleteUser(),
    UpdateUser(),
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
                    'Add User',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.do_disturb_on_outlined),
                  ),
                  selectedIcon: Icon(Icons.do_disturb_on_outlined),
                  label: Text(
                    'Delete User',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.system_update_alt_outlined),
                  ),
                  selectedIcon: Icon(Icons.system_update_alt_outlined),
                  label: Text(
                    'Update User',
                    style: TextStyle(fontSize: 10),
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

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
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
  String dropdownValue = 'Admin';

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
                  return value.isEmpty ? "MSHV cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'MSHV',
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
                  return value.isEmpty ? "Password cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
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
                  return value.isEmpty ? "Email cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
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
                  return value.isEmpty ? "Name cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                ),
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 30,
                  elevation: 15,
                  underline: Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  onChanged: (String newvalue) {
                    setState(() {
                      dropdownValue = newvalue;
                    });
                  },
                  items: <String>['Admin', 'User']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              DropDownField(
                onValueChanged: (dynamic value) {
                  country_id = value;
                },
                value: country_id,
                required: true,
                hintText: 'Find account with MSHV',
                labelText: 'Choose course',
                items: country,
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

class DeleteUser extends StatefulWidget {
  @override
  _DeleteUserState createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
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
                hintText: 'Find account with MSHV',
                labelText: 'MSHV',
                items: country,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                enabled: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Rule',
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

class UpdateUser extends StatefulWidget {
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
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
                hintText: 'Find acsount with MSHV',
                labelText: 'MSHV',
                items: country,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Email cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
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
                  return value.isEmpty ? "Password cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
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
                  return value.isEmpty ? "Name cannot be empty" : null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
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
              DropDownFormField(
                validator: (value) {
                  return value.isEmpty ? "Last name cannot be empty" : null;
                },
                titleText: 'Choose Courses',
                hintText: 'Please choose one',
                value: _myActivity,
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "Running",
                    "value": "Running",
                  },
                  {
                    "display": "Climbing",
                    "value": "Climbing",
                  },
                  {
                    "display": "Walking",
                    "value": "Walking",
                  },
                  {
                    "display": "Swimming",
                    "value": "Swimming",
                  },
                  {
                    "display": "Soccer Practice",
                    "value": "Soccer Practice",
                  },
                  {
                    "display": "Baseball Practice",
                    "value": "Baseball Practice",
                  },
                  {
                    "display": "Football Practice",
                    "value": "Football Practice",
                  },
                ],
                textField: 'display',
                valueField: 'value',
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
