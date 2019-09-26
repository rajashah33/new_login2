import 'package:flutter/material.dart';
import 'package:new_login/scoped_models/home_model.dart';
import 'package:new_login/ui/shared/ui_helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';
import 'package:new_login/ui/login_register/flip_card_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: locator<HomeModel>(),
      child: ScopedModelDescendant<HomeModel>(
        builder: (context, child, model) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Welcome User!',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  child: Text('Please select any one option:'),
                  padding: EdgeInsets.only(bottom: 30.0),
                ),
                UIHelper.designButton(
                    title: 'Customer',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/flipPage', arguments: false);
                    }),
                UIHelper.designButton(
                    title: 'Seller',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/flipPage', arguments: true);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
