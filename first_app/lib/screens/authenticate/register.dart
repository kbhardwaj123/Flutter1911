import 'package:first_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  double screenHeight,screenWidth;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 0.01*screenHeight,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                controller: _emailController,
              ),
              SizedBox(height: 0.01*screenHeight,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 0.01*screenHeight,),
              RaisedButton(
                color: Colors.pink[70],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async {

                },
              ),
            ],
          ),
        ),
      ),
    );
  } 
}