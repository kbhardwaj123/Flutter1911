import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'model/product.dart';

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backlayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.currentCategory,
    @required this.frontLayer,
    @required this.backlayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : assert(currentCategory !=null),
  assert(frontLayer !=null),
  assert(backlayer !=null),
  assert(frontTitle !=null),
  assert(backTitle !=null);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  Widget _buildStack() {
    return Stack(
      key: _backdropKey,
      children: <Widget>[
        widget.backlayer,
        widget.frontLayer,
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 8.0,
      titleSpacing: 4.0,
      leading: Icon(Icons.menu),
      title: Text('SHRINE'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search,semanticLabel: 'search'),
          onPressed: () {

          },
        ),
        IconButton(
          icon: Icon(Icons.tune,semanticLabel: 'filter',),
          onPressed: () {

          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: _buildStack(),
    );
  }
}