import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
  storeNewUser(user, context) {
    Firestore.instance.collection('/users').add({}).then((value) {
      print('signedIn');
      print(user.email);
    }).catchError((e) {
      print(e);
    });
  }
}