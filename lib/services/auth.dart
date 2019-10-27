import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user Object

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid:user.uid) : null;
  }

  //Anonymous SignIn
  Future signInAnonymous() async {
    try{
      AuthResult result  = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }

  }
  
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  //Email SignIn

  //Email Register
   Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  //SignOut
   Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


}