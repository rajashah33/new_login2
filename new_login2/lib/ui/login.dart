import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:new_login/style.dart';

class FrontMaterial extends StatelessWidget {
  const FrontMaterial({
    Key key,
    @required this.cardKey,
  }) : super(key: key);

  final GlobalKey<FlipCardState> cardKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(24.0),
      shadowColor:
          Color(0x802196F3).withOpacity(0.2),
      child: Container(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome back!',
              style: kHeadingStyle,
            ),
            Text(
              'Please sign in',
              textAlign: TextAlign.left,
              style: kSubHeadingStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType:
                    TextInputType.emailAddress,
                // controller: _myInEmail,
                style: kTextFieldText,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail, color: Colors.grey,),
                  labelStyle: kTextFieldStyle,
                  contentPadding: kTextFieldPadding,
                ),
                // textInputAction:
                //     TextInputAction.done,
                // focusNode: _emailInFocus,
                // onFieldSubmitted: (term) {
                //   _fieldFocusChange(
                //       context,
                //       _emailInFocus,
                //       _passwordInFocus);
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                // controller: _myInPassword,
                style: kTextFieldText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                  labelStyle: kTextFieldStyle,
                  contentPadding: kTextFieldPadding,
                ),
                // textInputAction:
                //     TextInputAction.done,
                // focusNode: _passwordInFocus,
                // onFieldSubmitted: (value) {
                //   _passwordInFocus.unfocus();
                // },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 16.0),
              child: Material(
                color: Colors.blue.shade800,
                borderRadius:
                    BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //TODO
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Sign In',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //TODO
              },
              child: Text(
                'Forgot Password?',
                style: kFlatButton,
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: <Widget>[
                Text('New User?', style: kFlatText),
                GestureDetector(
                  onTap: () {
                    cardKey.currentState
                        .toggleCard();
                  },
                  child: Text(
                    'Sign Up',
                    style: kFlatButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}