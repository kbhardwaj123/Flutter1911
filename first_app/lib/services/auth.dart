import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/model/user.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebase(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      // return _userFromFirebase(user);
      return user;
    }  catch(e) {
      print(e.toString());
      return null;
    }
  }
}