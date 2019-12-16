import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class JsonPage extends StatelessWidget {
  _makeGetRequest() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
  Response response = await get(url);
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  final map = jsonDecode(json) as Map<String, dynamic>;
  return map;
  }

  // dynamic _returnMap(String json) {
  //   Map<String, dynamic> map = jsonDecode(json);
  //   return map;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text('Json Sample Page'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            print(_makeGetRequest());
          },
        ),
      ),
    );
  }
}