import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboard extends StatefulWidget {
  MenuDashboard({Key key}) : super(key: key);

  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  bool _is_collapsed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: <Widget>[
        menu(context),
        dashboard(context),
      ],)
    );
  }
 
  Widget menu(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 7.0),
        ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
        SizedBox(height: 7.0),
        ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        SizedBox(height: 7.0),
        ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Icon(Icons.update),
          title: Text('Utility'),
        ),
        SizedBox(height: 7.0),
        ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Icon(Icons.functions),
          title: Text('Funds Transfer'),
        ),
        SizedBox(height: 7.0),
        ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Icon(Icons.branding_watermark),
          title: Text('Branches'),
        ),
        SizedBox(height: 7.0),
      ],
    );
  }

  Widget dashboard(context) {
    return Material(
      elevation: 8.0,
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _is_collapsed = !_is_collapsed;
                  });
                },
              ),
              Text('Test App'),
              Icon(Icons.settings)
            ],
          ),
        ],         
      ),
    );
  }

}
  

