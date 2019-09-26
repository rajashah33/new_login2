import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_login/ui/home_view.dart';
import 'package:new_login/ui/login_register/flip_card_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed while calling Navigator.pushedNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/flipPage':
        if (args is bool) {
          return MaterialPageRoute(
              builder: (context) => FlipPage(isSeller: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          body: Center(
        child: Text("Error: No Page Route"),
      ));
    });
  }
}
