import 'package:flutter/material.dart';
import 'package:flutter_quiz/menu.dart';

import 'package:flutter_quiz/user.dart';

void main() => runApp(MyApp());

///Default App created by Flutter Project
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'HomeWork 2 Quiz App';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

/// Create a Form widget.
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

/// Create a corresponding State class.
/// This class holds data related to the form.
class MyHomePageState extends State<MyHomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyHomePageState>.
  final _formKey = GlobalKey<FormState>();
  ///Controller for Username
  final _userController = TextEditingController();
  ///Controller for Password
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _userController,
            decoration: const InputDecoration(
              hintText: 'Your Student User Login',
              labelText: 'User ID',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MaterialButton(
              onPressed: () async {

                if (_formKey.currentState.validate()) {
                  var user = new User(_userController.text, _passController.text);
                  var check = await user.validateCredentials();
                    if (check == true) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                              builder: (context) => Menu(user)));
                  } else {
                      showAlertDialog(context, 'Invalid Credentials');
                  }
                }
              },
              textColor: Colors.white,
              color: Colors.blue,
              height: 50,
              child: Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }

  ///Incorrect Login Information
  showAlertDialog(BuildContext context, String reason) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Incorrect User Information"),
    content: Text("Reason: $reason"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}
