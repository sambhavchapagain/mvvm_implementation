import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_app/utils/routes/routes.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/view/login_screen.dart';
import 'package:providers_app/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel())
      
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}

