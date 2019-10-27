import 'package:flutter/material.dart';
import 'package:movies/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign In Aninymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymous();
            if(result == null){
              print('error Signin in');
            } else {
              print('signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}