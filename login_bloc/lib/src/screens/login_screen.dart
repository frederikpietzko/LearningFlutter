import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            obscureText: true,
            onChanged: bloc.changePassword);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          submitButton(),
        ],
      ),
    );
  }
}
