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
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0/9.0,
        children: <Widget>[Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0/11.0,
                child: Image.asset('assets/diamond.png'),
              ),
            ],
          ),
        )],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}