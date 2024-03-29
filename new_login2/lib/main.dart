import 'package:flutter/material.dart';
import 'package:new_login/route_generator.dart';
// import 'package:new_login/Model/loginModel.dart';
import 'package:new_login/service_locator.dart';
import 'package:new_login/ui/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
//
