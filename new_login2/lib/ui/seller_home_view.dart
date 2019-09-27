import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:new_login/scoped_models/new_product_model.dart';
import 'package:new_login/ui/product/new-product.dart';
import 'package:new_login/ui/shared/app_colors.dart';
import 'package:new_login/ui/shared/ui_helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeViewState createState() => _SellerHomeViewState();
}

class _SellerHomeViewState extends State<SellerHome> {
  String prodNameValMsg = '', prodValMsg = '';
  final prodNameController = TextEditingController();

  final prodNameFocus = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<NewProductModel>(
      model: locator<NewProductModel>(),
      child: ScopedModelDescendant<NewProductModel>(
        builder: (context, child, model) => Scaffold(
          appBar:
              AppBar(title: Text('Welcome Seller'), backgroundColor: darkGrey),
          drawer: _buildDrawer(context),
          floatingActionButton:
              UIHelper.customFloatingActionButton(childFunctionList: [
            SpeedDialChild(
                child: Icon(Icons.shopping_basket),
                backgroundColor: Colors.green,
                label: 'Add new Product',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => NewProduct(),
                      ));
                }),
          ]),
          body: Center(
            child: Text('Welcome Seller'),
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: darkGrey),
            currentAccountPicture: new CircleAvatar(
              radius: 50.0,
              backgroundImage:
                  NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
            ),
            accountEmail: Text(''),
            accountName: Text('Hello! User'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('My Products'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Passbook'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LogOut'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
