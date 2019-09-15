import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  static const double SpaceSmall = 20.0;
  static const double SpaceMedium = 40.0;
  static const double SpaceLarge = 60.0;

  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static Widget inputField({
    @required TextEditingController controller,
    FocusNode currentFocus,
    Function onFieldSubmitted,
    String placeholder,
    Function onChanged,
    Icon icon,
    String validationMessage,
    TextInputType inputType = TextInputType.text,
    bool isPassword = false,
    double edgeSpace = 10.0,
    double padding = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Container(
          alignment: Alignment(0.0, 0.0),
          padding: EdgeInsets.only(left: padding),
          // margin: EdgeInsets.only(top: spaceBetweenTitle),
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: lightGrey),

          child: TextFormField(
            onChanged: onChanged,
            textInputAction: TextInputAction.done,
            focusNode: currentFocus,
            onFieldSubmitted: onFieldSubmitted,
            controller: controller,
            obscureText: isPassword,
            keyboardType: inputType,
            style: TextStyle(fontSize: 15.0),
            decoration: InputDecoration(
              prefixIcon: icon,
              hintText: placeholder,
              hintStyle: TextStyle(color: grey, fontSize: 12.0),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0))),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0))),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0))),
            ),
          ),
        ),
        validationMessage != null
            ? Text(validationMessage,
                style: TextStyle(color: Colors.red[400], fontSize: 12.0))
            : Container(
                margin: EdgeInsets.all(5.0),
              ),
      ]),
    );
  }

  static Widget designButton({@required String title, Function onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: grey,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0, color: primaryColor),
          ),
        ),
      ),
    );
  }

  static Widget fullScreenButton({String title, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }
}
