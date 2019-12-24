import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/brew.dart';
import 'package:first_app/model/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
  
  Future updateUserData(String sugars,String name,int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars':sugars,
      'name':name,
      'strength':strength
    });
  }

  //to return a list of brew
  List<Brew> _brewListFormSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  //making UserData class out of Document snapshot
  UserData _userDataFromSnampshot(DocumentSnapshot snap) {
    return UserData(
      uid: uid,
      name: snap.data['name'],
      sugars: snap.data['sugars'],
      strength: snap.data['strength']
    );
  }


  //brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFormSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
      .map(_userDataFromSnampshot);
  }

}