import 'package:flutter/material.dart';

// final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboard extends StatefulWidget {
  MenuDashboard({Key key}) : super(key: key);

  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  bool _is_collapsed = false;
  final Duration duration = Duration(milliseconds: 300);
  double screenWidth,screenHeight;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: Stack(children: <Widget>[
        menu(context),
        dashboard(context),
      ],)
    );
  }
 
  Widget menu(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: screenHeight*0.1),
          ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: Icon(Icons.update),
            title: Text('Utility'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: Icon(Icons.functions),
            title: Text('Funds Transfer'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: Icon(Icons.branding_watermark),
            title: Text('Branches'),
          ),
        ],
      )
    );
  }

  Widget dashboard(context) {
    return Container(
      child: AnimatedPositioned(
        top: _is_collapsed ? 0 : 0.2*screenHeight,
        bottom: _is_collapsed ? 0 : 0.2*screenHeight,
        right: _is_collapsed ? 0 : -0.1*screenWidth,
        left: _is_collapsed ? 0 : 0.5*screenWidth,
        duration: duration,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          elevation: 8.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: _is_collapsed ?  EdgeInsets.all(20.0) : EdgeInsets.all(10.0),
                child: Row(
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
                )
              )
            ],         
          ),
        )
      )
    );
  }

}
  

