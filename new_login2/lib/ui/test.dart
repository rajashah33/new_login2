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
import 'login.dart';

class FlipPage extends StatefulWidget {
  @override
  _FlipPageState createState() => _FlipPageState();
}

class _FlipPageState extends State<FlipPage> {

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  // final _formFrontKey = GlobalKey<FormState>();
  // final _formBackKey = GlobalKey<FormState>();
  // var _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    final bottom = MediaQuery
        .of(context)
        .viewInsets
        .bottom;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: Center(
          child: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
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
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                              child: FlipCard(
                                key: cardKey,
                                // flipOnTouch: false,
                                direction: FlipDirection.HORIZONTAL,
                                front: new FrontMaterial(cardKey: cardKey),
                                back: backMaterial(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Material frontMaterial (BuildContext context) {
//   return Material(
//     color: Colors.white.withOpacity(0.8),
//                                 borderRadius: BorderRadius.circular(24.0),
//                                 shadowColor:
//                                 Color(0x802196F3).withOpacity(0.9),
//                                 child: Form(
//                                   child: Text(
//                                     'Front Flip card',
//                                   ),
//                                   key: _formFrontKey,
//                                   // autovalidate: _autoValidate,
//                                   // child: frontUI(context),
//                                 ),
//   );
// }

Material backMaterial (BuildContext context) {
  return Material (
    color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(24.0),
                                shadowColor: Color(0x802196F3),
                                child: Form(
                                  child: Text(
                                    'Back Flip Card',
                                  ),
                                  // key: _formBackKey,
                                  // autovalidate: _autoValidate,
                                  // child: backUI(context),
                                ),
  );
}