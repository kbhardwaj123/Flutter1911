import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'colors.dart';

class GridPage extends StatelessWidget {
  
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );
    return products.map(
      (product) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0/11.0,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product == null ? '' : product.name,
                        style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        product == null ? '' : formatter.format(product.price),
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    ).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0/9.0,
          children: _buildGridCards(context),
        )
      );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isCollapsed = true;
  double screenWidth,screenHeight;
  final Duration duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _isCollapsed = !_isCollapsed;
            });
          },
        ),
        title: Text('SHRINE'),
        actions: <Widget>[

        ],
      ),
      body: 
      Container(
        color: kShrinePink100,
        child: Stack(
          children: <Widget>[
            menu(context),
            dashboard(context)
          ],
        ),
      ),
      bottomNavigationBar: bottom(),
    );
  }

  Widget menu(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: screenHeight*0.1),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            leading: Icon(Icons.update),
            title: Text('Utility'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            leading: Icon(Icons.functions),
            title: Text('Funds Transfer'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
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
        top: _isCollapsed ? 0 : 0.8*screenHeight,
        right: 0,
        left: 0,
        bottom: _isCollapsed ? 0 : -0.8*screenHeight,
        duration: duration,
        child: Material(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0))
          ),
          animationDuration: duration,
          elevation: 25.0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: GridPage(),
          ),
        ),
      ),
    );
  }
    Widget bottom() {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
