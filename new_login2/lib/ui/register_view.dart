import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/scoped_models/register_model.dart';
import 'package:new_login/service_locator.dart';
import 'package:new_login/ui/base_view.dart';
import 'package:new_login/ui/login_view.dart';
import 'package:new_login/ui/shared/app_colors.dart';
import 'package:new_login/ui/shared/ui_helper.dart';
import 'package:new_login/validator.dart';

class Register extends StatefulWidget {
  final bool isSeller;
  final GlobalKey<FlipCardState> cardKey;

  Register({Key key, @required this.isSeller, this.cardKey}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String nameValMsg = '',
      emailValMsg = '',
      phoneValMsg = '',
      passwordValMsg = '',
      confPasswordValMsg = '';
  final nameFocus = new FocusNode();
  final emailFocus = new FocusNode();
  final phoneFocus = new FocusNode();
  final passwordFocus = new FocusNode();
  final confPasswordFocus = new FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  DateTime date;
  String dobText = 'Date of Birth';
  var _gender = ['Male', 'Female', 'Other'];
  var _currentItemSelected;

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterModel>(
      builder: (context, child, model) {
        return SafeArea(
          child: Material(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3).withOpacity(0.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildRegisterCardTitle(),
                _buildRegisterCardTextFormFeild(model),
                _buildGenderDOB(model),
                _buildMessageBox(model.state),
                _buildRegisterButton(model),
                _buildAlreadyAccount(),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _buildRegisterCardTitle() {
    var _heading = (widget.isSeller == true)
        ? 'Create & start Selling'
        : 'Create & start Shopping';
    return new Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Center(
            child: new Text(
              _heading,
              style: TextStyle(fontSize: 25.0, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterCardTextFormFeild(RegisterModel model) {
    return Container(
      child: Form(
        // key: _formKey,
        autovalidate: false,
        child: Column(
          children: <Widget>[
            UIHelper.inputField(
              placeholder: 'Name',
              controller: nameController,
              icon: Icon(Icons.person),
              currentFocus: nameFocus,
              validationMessage: nameValMsg,
              onFieldSubmitted: (v) {
                nameValMsg = model.validateName(nameController.text);
                nameFocus.unfocus();
                FocusScope.of(context).requestFocus(emailFocus);
              },
            ),
            UIHelper.inputField(
              placeholder: 'Email',
              controller: emailController,
              icon: Icon(Icons.email),
              validationMessage: emailValMsg,
              inputType: TextInputType.emailAddress,
              currentFocus: emailFocus,
              onFieldSubmitted: (v) {
                emailValMsg = model.validateEmail(emailController.text);
                emailFocus.unfocus();
                FocusScope.of(context).requestFocus(phoneFocus);
              },
            ),
            UIHelper.inputField(
              placeholder: 'Phone',
              controller: phoneController,
              icon: Icon(Icons.phone),
              validationMessage: phoneValMsg,
              inputType: TextInputType.phone,
              currentFocus: phoneFocus,
              onFieldSubmitted: (v) {
                phoneValMsg = model.validateMobile(phoneController.text);
                phoneFocus.unfocus();
                FocusScope.of(context).requestFocus(passwordFocus);
              },
            ),
            UIHelper.inputField(
              placeholder: 'Password',
              controller: passwordController,
              isPassword: true,
              icon: Icon(Icons.lock_outline),
              validationMessage: passwordValMsg,
              currentFocus: passwordFocus,
              onFieldSubmitted: (v) {
                passwordValMsg =
                    model.validatePassword(passwordController.text);
                passwordFocus.unfocus();
                FocusScope.of(context).requestFocus(confPasswordFocus);
              },
            ),
            UIHelper.inputField(
              placeholder: 'Confirm Password',
              controller: confPasswordController,
              isPassword: true,
              icon: Icon(Icons.lock),
              validationMessage: confPasswordValMsg,
              currentFocus: confPasswordFocus,
              onFieldSubmitted: (v) {
                confPasswordValMsg =
                    model.validatePassword(confPasswordController.text);
                confPasswordFocus.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderDOB(RegisterModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DropdownButton<String>(
          hint: Text(
            'Gender',
          ),
          items: _gender.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
              ),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentItemSelected = newValueSelected;
              // TODO: see the model. gender

              model.gender = newValueSelected; // set model gender variable
            });
          },
          value: _currentItemSelected,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                dobText,
              ),
              color: Colors.grey.shade200,
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: date == null ? DateTime.now() : date,
                  firstDate: DateTime(1960),
                  lastDate: DateTime(2020),
                ).then((_date) {
                  setState(() {
                    date = _date;
                    dobText = DateFormat('dd MMM yyyy').format(date);
                    model.dob = date.toString().substring(0, 10);
                  });
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRegisterButton(RegisterModel model) {
    return new Container(
      child: Center(
        child: UIHelper.designButton(
          title: 'Create',
          onPressed: () {
            model.saveData(
                nameController.text,
                emailController.text,
                phoneController.text,
                passwordController.text,
                confPasswordController.text,
                isSeller: widget.isSeller);
          },
        ),
      ),
    );
  }

  Widget _buildAlreadyAccount() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Already have account? ',
              style: new TextStyle(color: Color(0xFF2E3233))),
          GestureDetector(
            child: Text(
              "Sign In",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: primaryColor,
                  fontSize: 17.0),
            ),
            onTap: () {
              widget.cardKey.currentState.toggleCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBox(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return Center(child: CircularProgressIndicator());
        break;

      case ViewState.Error:
        return Center(child: Text('Error'));
        break;

      case ViewState.Retrieved:
        return Center(child: Text('Success'));
        break;

      case ViewState.PasswordNotMatched:
        return Center(child: Text('Password Not matched'));
        break;

      default:
        return Center(child: Text(''));
        break;
    }
  }
}
