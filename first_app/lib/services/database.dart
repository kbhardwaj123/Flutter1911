import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/brew.dart';

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

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFormSnapshot);
  }

}