import 'package:flutter/material.dart';
import 'package:first_app/services/auth.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  SignIn({this.toggleView}); 

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person_add),
            label: Text('Register'),
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
                  'sign in',
                  style: TextStyle(
                    color: Colors.black54
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