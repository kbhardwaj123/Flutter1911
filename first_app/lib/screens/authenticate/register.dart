import 'package:first_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  double screenHeight,screenWidth;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign Up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        // child: RaisedButton(
        //   child: Text('Sign in Anonimously'),
        //   onPressed: () async {
        //     dynamic result = await _auth.signInAnon();
        //     if(result == null) {
        //       print('error signing in');
        //     } else {
        //       print('signed in');
        //       print(result.uid);
        //     }
        //   },
        // ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 0.01*screenHeight,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                controller: _emailController,
                validator: (val) => val.isEmpty ? 'Enter an Email':null,
              ),
              SizedBox(height: 0.01*screenHeight,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                controller: _passwordController,
                validator: (val) => val.length<6 ? 'Enter a longer password':null,
                obscureText: true,
              ),
              SizedBox(height: 0.01*screenHeight,),
              RaisedButton(
                color: Colors.pink[70],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black54
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailPassword(_emailController.value.text, _passwordController.value.text);
                    if(result==null) {
                      setState(() {
                        error = 'please supply valid email';
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  } 
}