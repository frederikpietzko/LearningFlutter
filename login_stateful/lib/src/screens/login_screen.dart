import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email address",
        hintText: "you@example.com",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) => email = value,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) => password = value,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (!formKey.currentState.validate()) return;
        formKey.currentState.save();
        print('Time ti post $email and $password to my API');
      },
      child: Text("Submit"),
      color: Colors.blue,
    );
  }

  Widget build(context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
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
