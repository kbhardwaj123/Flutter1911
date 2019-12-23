import 'package:first_app/model/user.dart';
import 'package:first_app/screens/authenticate/authenticate.dart';
import 'package:first_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Authenticate();
  }
}