import 'package:flutter/cupertino.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class RegisterModel extends Model {
  StorageService storageService = locator<StorageService>();

  var gender;
  var dob;
  bool inputValid = false;
  String _password;
  ViewState _state;
  ViewState get state => _state;

  // method to save data to databse
  void saveData(name, email, phone, password, confirmPassword,
      {Key key, @required bool isSeller}) async {
    _password = password;
    var result;
    if (inputValid) {
      _setState(ViewState.Busy);
      result = await storageService.saveData(
          name, email, phone, password, gender, dob, isSeller);
      if (result == true) {
        _setState(ViewState.Retrieved);
      } else {
        _setState(ViewState.Error);
      }
    } else {
      _setState(ViewState.PasswordNotMatched);
    }
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 30) {
      inputValid = false;
      return "Name must be less than 30 characters";
    } else {
      if (value.length == 0) {
        inputValid = false;
        return "Name is Required";
      } else if (!regExp.hasMatch(value)) {
        inputValid = false;
        return "Name must be a-z and A-Z";
      }
    }
    inputValid = true;
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length != 10) {
      inputValid = false;
      return "Enter a valid Mobile no.";
    } else {
      if (value.length == 0) {
        inputValid = false;
        return "Mobile is Required";
      } else if (value.length != 10) {
        inputValid = false;
        return "Mobile number must 10 digits";
      } else if (!regExp.hasMatch(value)) {
        inputValid = false;
        return "Mobile Number must be digits";
      } else {
        inputValid = true;
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

  String validateConfirmPassword(String value) {
    if (value != _password) {
      inputValid = false;
      return "Password not matched";
    } else {
      inputValid = true;
      return null;
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

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
