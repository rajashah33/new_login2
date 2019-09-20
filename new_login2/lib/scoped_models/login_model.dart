import 'package:flutter/cupertino.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class LoginModel extends Model {
  StorageService storageService = locator<StorageService>();
  var inputValid = false;
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void checkData(email, password, {Key key, @required isSeller}) async {
    _setState(ViewState.Busy);

    if (inputValid) {
      bool result =
          await storageService.retrieveData(email, password, isSeller);

      if (result == true) {
        _setState(ViewState.Success);
      } else {
        _setState(ViewState.Error);
      }
    } else {
      _setState(ViewState.Error);
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      _setValidation(false);
      return "Enter email in 30 characters";
    } else {
      _setValidation(false);
      if (value.length == 0) {
        return "Email is Required";
      } else if (!regExp.hasMatch(value)) {
        _setValidation(false);
        return "Invalid Email";
      } else {
        _setValidation(true);
        return null;
      }
    }
  }

  String validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#%$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      _setValidation(false);
      return "Enter password in 30 characters";
    } else {
      if (value.length == 0) {
        _setValidation(false);
        return "Password is Required";
      } else if (!regExp.hasMatch(value)) {
        _setValidation(false);
        return "Password should contain 1 capital letter, 1 digit and symbol";
      } else {
        _setValidation(true);
        return null;
      }
    }
  }

  void _setValidation(bool newValidation) {
    inputValid = newValidation;
    notifyListeners();
  }

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
