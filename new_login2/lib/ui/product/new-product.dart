import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_login/scoped_models/new_product_model.dart';
import 'package:new_login/ui/shared/font_styles.dart';
import 'package:new_login/ui/shared/ui_helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';
import 'package:new_login/ui/login_register/flip_card_view.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  var categoryList = [
    'Fashion',
    'Edibles',
    'Educational',
    'Stationaries',
    'Workout'
  ];
  var selectedCategory;

  String prodNameValMsg = '', prodValMsg = '';
  final prodNameController = TextEditingController();

  final prodNameFocus = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<NewProductModel>(
      model: locator<NewProductModel>(),
      child: ScopedModelDescendant<NewProductModel>(
        builder: (context, child, model) => Scaffold(
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add new Product',
                    style: styleHeading,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Choose a Category:'),
                      UIHelper.customDropDown(
                          title: 'Product Category',
                          itemList: categoryList,
                          selectedValue: selectedCategory,
                          onChanged: (String newSelectedValue) {
                            setState(() {
                              selectedCategory = newSelectedValue;
                            });
                          })
                    ]),
                UIHelper.horizontalSpace(20.0),
                UIHelper.inputField(
                    label: 'Product Name',
                    placeholder: 'Enter Product Name',
                    controller: prodNameController,
                    currentFocus: prodNameFocus,
                    validationMessage: prodNameValMsg,
                    inputType: TextInputType.text,
                    hintLeftPadding: 15.0,
                    onChanged: (v) {
                      // prodValMsg = model.validateEmail(emailController.text);
                    },
                    onFieldSubmitted: (v) {
                      prodNameFocus.unfocus();
                      // FocusScope.of(context).requestFocus(passwordFocus);
                    }),
                UIHelper.inputField(
                    label: 'Brand',
                    placeholder: 'Enter Brand Name',
                    controller: prodNameController,
                    currentFocus: prodNameFocus,
                    validationMessage: prodNameValMsg,
                    inputType: TextInputType.text,
                    hintLeftPadding: 15.0,
                    onChanged: (v) {
                      // prodValMsg = model.validateEmail(emailController.text);
                    },
                    onFieldSubmitted: (v) {
                      prodNameFocus.unfocus();
                      // FocusScope.of(context).requestFocus(passwordFocus);
                    }),
                UIHelper.inputField(
                    label: 'Price',
                    placeholder: 'Enter Price',
                    controller: prodNameController,
                    currentFocus: prodNameFocus,
                    validationMessage: prodNameValMsg,
                    inputType: TextInputType.number,
                    hintLeftPadding: 15.0,
                    onChanged: (v) {
                      // prodValMsg = model.validateEmail(emailController.text);
                    },
                    onFieldSubmitted: (v) {
                      prodNameFocus.unfocus();
                      // FocusScope.of(context).requestFocus(passwordFocus);
                    }),
                Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Column(children: <Widget>[
                      UIHelper.designButton(
                          title: 'Next ',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlipPage(
                                    isSeller: false,
                                  ),
                                ));
                          })
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
