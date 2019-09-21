import 'package:flutter/material.dart';
import 'package:new_login/scoped_models/new_product_model.dart';
import 'package:new_login/ui/shared/ui_helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';
import 'package:new_login/ui/login_register/flip_card_view.dart';

class NewProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<NewProductModel>(
      model: locator<NewProductModel>(),
      child: ScopedModelDescendant<NewProductModel>(
        builder: (context, child, model) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Add new Product',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      children: <Widget>[
                        UIHelper.designButton(
                          title: 'Create Product',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlipPage(
                                    isSeller: false,
                                  ),
                                ));
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
