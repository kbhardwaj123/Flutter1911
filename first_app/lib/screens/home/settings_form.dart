import 'package:first_app/model/user.dart';
import 'package:first_app/services/database.dart';
import 'package:first_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey3 = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //non-Standard method to Access Stream Data
    //used when the Stream data is only required by a particular widget
    //insted of trickling down to all the child widgets like StreamProvider
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      //the snapshot mentioned below is flutter downstream received object 
      //it has nothing to do with cloud Firestore's snapshot
      builder: (context,snapshot) {
        if(snapshot.hasData) {
          UserData userdata = snapshot.data;
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey3,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your Brew Particulars',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    initialValue: (userdata.name == 'new member') ? null : userdata.name,
                    decoration: InputDecoration(
                      labelText: 'Name'
                    ),
                    onChanged: (val) {
                      setState(() {
                        _currentName = val;
                      });
                    },
                    validator: (val) => val.isEmpty ? 'Enter a name' : null,
                  ),
                  SizedBox(height: 20.0,),
                  //Standard DropDown conversion
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Select sugar preference'
                    ),
                    value: _currentSugars ?? userdata.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),);
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _currentSugars = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Slider(
                    value: (_currentStrength ?? userdata.strength).toDouble(),
                    activeColor: Colors.brown[_currentStrength ?? userdata.strength],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) {
                      setState(() {
                        _currentStrength = val.round();
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.brown),
                    ),
                    onPressed: () async {
                      if(_formKey3.currentState.validate()) {
                        await DatabaseService(uid: user.uid)
                          .updateUserData(
                            _currentSugars ?? userdata.sugars,
                            _currentName ?? userdata.name,
                            _currentStrength ?? userdata.strength
                          );
                      Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }
        return Loading();
      }    
    );
  }
}