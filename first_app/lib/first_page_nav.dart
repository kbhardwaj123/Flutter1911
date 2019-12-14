import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',style: TextStyle(fontSize: 50),
            ),
            RaisedButton(
              child: Text('Second page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                      SecondPage(data: 'Hello there from the first page'),
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({Key key, this.data}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Second Page', style: TextStyle(fontSize: 50),),
            Text(data,style: TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}