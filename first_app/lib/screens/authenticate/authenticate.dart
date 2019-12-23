import 'package:first_app/screens/authenticate/register.dart';
import 'package:first_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool sign_in_shown=true;
  void toggle() {
    setState(() => sign_in_shown = !sign_in_shown);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: sign_in_shown? SignIn(toggleView: toggle) : Register(toggleView: toggle),
    );
  }
}