import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey3 = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  final _nameController = TextEditingController();
  String _currentSugars;
  int _currentStrength;


  @override
  Widget build(BuildContext context) {
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
               decoration: InputDecoration(
                 labelText: 'Name'
               ),
               controller: _nameController,
               validator: (val) => val.isEmpty ? 'Enter a name' : null,
             ),
             SizedBox(height: 20.0,),
             //Standard DropDown conversion
             DropdownButtonFormField(
               decoration: InputDecoration(
                 labelText: 'Select sugar preference'
               ),
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
               value: (_currentStrength ?? 100).toDouble(),
               activeColor: Colors.brown[_currentStrength ?? 100],
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

               },
             )
           ],
         ),
       ),
    );
  }
}