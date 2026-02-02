import 'package:flutter/material.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/view/home_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: (){
          Navigator.pushNamed(context, RoutesName.home);
          // Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeScreen()));
        },
          child: Text('click'),

        ),
      ),

      );

  }

}
