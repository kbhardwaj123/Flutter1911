import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  BrewList({Key key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach(
      (brew) {
        print(brew.name);
      }
    );
    return Container(
       
    );
  }
}