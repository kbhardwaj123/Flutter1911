import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:first_app/services/shrine_usermanage.dart';

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color,this.child})
    : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                controller: _usernameController,
              ),
            ),
            SizedBox(height: 12.0,),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                controller: _passwordController,
                obscureText: true,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0))
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0))
                  ),
                  elevation: 8.0,
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _usernameController.value.toString(),password: _passwordController.value.toString()).then(
                      (signedInUser) {
                        UserManagement().storeNewUser(signedInUser, context);
                      }
                    ).catchError((e) {print(e);});
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}