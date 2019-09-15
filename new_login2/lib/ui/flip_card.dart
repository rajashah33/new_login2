import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flip_card/flip_card.dart';
import 'package:new_login/style.dart';
import 'package:new_login/enums/view_states.dart';
import 'package:new_login/scoped_models/login_model.dart';
import 'package:new_login/scoped_models/register_model.dart';
import 'package:new_login/ui/base_view.dart';
import 'package:new_login/ui/login_view.dart';
import 'package:new_login/ui/register_view.dart';
import 'package:new_login/ui/shared/app_colors.dart';
import 'package:new_login/ui/shared/ui_helper.dart';

class FlipPage extends StatefulWidget {
  final bool isSeller;
  FlipPage({Key key, @required this.isSeller}) : super(key: key);

  @override
  _FlipPageState createState() => _FlipPageState();
}

class _FlipPageState extends State<FlipPage> {
  // BuildContext get context => null;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final emailFocus = new FocusNode();
  final passwordFocus = new FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return BaseView<LoginModel>(
      builder: (context, child, model) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white70,
          body: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/bgimage2.jpg'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: _buildFlipCard(model),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildFlipCard(LoginModel model) {
    return Container(
      // TODO: Remove the card size and make it auto resisable
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height * 0.084,
      alignment: Alignment.center,
      padding: new EdgeInsets.only(
        top: 20.0,
        right: 10.0,
        left: 10.0,
        bottom: 0.0,
      ),
      child: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: Login(isSeller: widget.isSeller, cardKey: cardKey),
        back: Register(
          isSeller: widget.isSeller,
          cardKey: cardKey,
        ),
      ),
    );
  }
}
