import 'package:first_app/model/brew.dart';
import 'package:first_app/shared/loading.dart';
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
    //Standard provider method to access the stream contents
    final brews = Provider.of<List<Brew>>(context);
    if(brews == null) {return Loading();}
    brews.forEach(
      (brew) {
        print(brew.name);
      }
    );
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index) {
        return brewTile(brews[index]);
      },
    );
  }

  Widget brewTile(Brew brew) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}