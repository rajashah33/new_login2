import 'package:flutter/cupertino.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class LoginModel extends Model {
  StorageService storageService = locator<StorageService>();

  var inputValid = false;
  final passFocus = new FocusNode();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void checkData(email, password, {Key key, @required isSeller}) async {
    _setState(ViewState.Busy);

    bool result = await storageService.retrieveData(email, password, isSeller);

    if (result == true) {
      _setState(ViewState.Retrieved);
    } else {
      _setState(ViewState.Error);
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      return "Enter email in 30 characters";
    } else {
      if (value.length == 0) {
        return "Email is Required";
      } else if (!regExp.hasMatch(value)) {
        return "Invalid Email";
      } else {
        return null;
      }
    }
  }

  String validatePassword(String value) {
    if (value.length < 8) {
      inputValid = false;
      return "Enter a password more than 8 characters";
    } else {
      inputValid = true;
      return null;
    }
  }

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
