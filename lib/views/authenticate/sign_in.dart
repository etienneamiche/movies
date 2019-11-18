import 'package:flutter/material.dart';
import 'package:movies/services/auth.dart';
import 'package:movies/ui/background.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white),
            label: Text('Register',style:TextStyle(color: Colors.white)),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body:Stack(
        children: <Widget>[
           Background(),
           Container(
            padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        )
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        )
                    ),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.indigo,
                    child: Text('Sign In',style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                        if(_formKey.currentState.validate()){
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'Could not sign in with those credentials';
                          });
                        }
                      }
                      }
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.grey[300],
                      child: Text('Enter as a guest',style: TextStyle(color: Colors.white),),
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
                    SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                  ],
              ),
            ),
          )
      ]
      )

    );
  }
}