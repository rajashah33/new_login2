import 'package:flutter/cupertino.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class RegisterModel extends Model {
  StorageService storageService = locator<StorageService>();

  bool inputValid = false;
  String _password;
  ViewState _state;
  ViewState get state => _state;

  // method to save data to databse
  void saveData(name, email, phone, password, confirmPassword, gender, dob,
      {Key key, @required bool isSeller}) async {
    var result;
    if (inputValid) {
      _setState(ViewState.Busy);
      result = await storageService.saveData(
          name, email, phone, password, gender, dob, isSeller);
      if (result == true) {
        _setState(ViewState.Success);
      } else {
        _setState(ViewState.Error);
      }
    } else {
      if (_password != confirmPassword) {
        _setState(ViewState.PasswordNotMatched);
      } else {
        _setState(ViewState.Error);
      }
    }
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      _setValidation(false);
      return "Name must be less than 30 characters";
    } else {
      if (value.length == 0) {
        _setValidation(false);
        return "Name is Required";
      } else if (!regExp.hasMatch(value)) {
        _setValidation(false);
        return "Name must be a-z and A-Z";
      }
    }
    _setValidation(true);
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      _setValidation(false);

      return "Enter email in 30 characters";
    } else {
      if (value.length == 0) {
        _setValidation(false);

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

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length != 10) {
      _setValidation(false);

      return "Enter a valid Mobile no.";
    } else {
      if (value.length == 0) {
        _setValidation(false);
        return "Mobile is Required";
      } else if (value.length != 10) {
        _setValidation(false);

        return "Mobile number must 10 digits";
      } else if (!regExp.hasMatch(value)) {
        _setValidation(false);
        return "Mobile Number must be digits";
      } else {
        _setValidation(true);
        return null;
      }
    }
  }

  String validatePassword(String value) {
    _password = value;
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

  String validateConfirmPassword(confPassword) {
    if (confPassword != _password) {
      _setValidation(false);
      return "Password not matched";
    } else {
      _setValidation(true);
      return null;
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
