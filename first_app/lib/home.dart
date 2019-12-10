import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,semanticLabel: 'menu',),
          onPressed: () {
            print('Menu Button');
          },
        ),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,semanticLabel: 'search',),
            onPressed: () {
              print('Search Button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune,semanticLabel: 'filter',),
            onPressed: () {
              print('filter Button');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('You did it!!'),
        ),
      resizeToAvoidBottomInset: false,
    );
  }
}