import 'package:first_app/colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.backspace),
          color: kShrineBrown900,
          hoverColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings'),
      ),
      body: settings(context),
    );
  }
}

Widget settings(context) {
  return Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, int index) {
        return makeCard;
      }
    ),
  );
}

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
  child: Material(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0))
    ),
    child: Container(
      decoration: BoxDecoration(
        color: kShrinePink100,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 12.0, 0),
          decoration: new BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1.0,
                color: kShrineBrown900
              )
            )
          ),
          child: Icon(Icons.autorenew),
        ),
        title: Text(
          'Introduction to Driving',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),  
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale,
              color: Colors.yellowAccent,
            ),
            Text('Intermediate')
          ],
        ),
        trailing:  Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      ),
    ),
  ),
);

