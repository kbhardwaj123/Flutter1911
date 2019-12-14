import 'package:first_app/home.dart';
import 'package:first_app/login.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RouteGeneratorShrine {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginPage()
        );        
        break;
        case '/home':
          return MaterialPageRoute(
            builder: (_) => HomePage()
          );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('Error has occurred'),
            ),
          )
        );
    }
  }
} 

