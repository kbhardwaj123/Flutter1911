import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/model/user.dart';
import 'package:first_app/services/database.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebase(user)); Shortcut below
      .map(_userFromFirebase);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }  catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailPassword(String email,String pass) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: pass);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData('0', 'new member', 100);

      return _userFromFirebase(user);    
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailPassword(String email, String pass) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);    
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}