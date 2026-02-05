

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/view/home_screen.dart';
import 'package:providers_app/view/login_screen.dart';
import 'package:providers_app/view/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => SignupView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text(' no route defined'),
            ),
          );

        });
    }

  }
}