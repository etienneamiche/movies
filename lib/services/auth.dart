import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //Anonymous SignIn
  Future signInAnonymous() async {
    try{
      AuthResult result  = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //Email SignIn

  //Email Register

  //SignOut


}