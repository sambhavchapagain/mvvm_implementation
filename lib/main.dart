import 'package:flutter/material.dart';
import 'package:providers_app/utils/routes/routes.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
     initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

