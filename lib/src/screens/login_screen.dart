import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

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
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
        icon: Icon(Icons.email),
      ),
      validator: validateEmail,
      onSaved: (value) {
        if (value == null) {
          return;
        } else {
          _email = value;
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
        icon: Icon(Icons.lock),
      ),
      validator: validatePassword,
      onSaved: (value) {
        if (value == null) {
          return;
        } else {
          _password = value;
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text('Login'),
      onPressed: () {
        if (formKey.currentState == null) {
          return;
        } else {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('Form is valid');
          }
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
    );
  }
}
