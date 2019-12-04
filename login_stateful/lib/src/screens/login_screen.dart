import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email address",
        hintText: "you@example.com",
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () => print("Test"),
      child: Text("Submit"),
      color: Colors.blue,
    );
  }

  Widget build(context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton(),
            ],
          ),
        ));
  }
}
