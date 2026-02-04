import 'package:flutter/material.dart';
import 'package:providers_app/respository/components/round_button.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/utils/utils.dart';
import 'package:providers_app/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:providers_app/view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

      // dynamic response = await _apiSerivices.getPostApiResponse(AppUrl.loginUrl, data);
      // return response;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email@gmail.com',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),

            ValueListenableBuilder<bool>(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: value,
                  focusNode: passwordFocusNode,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'P@123',
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.password_sharp),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(
                        value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: height * .085),

            RoundButton(
              title: 'login',
              loading: authViewMode.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'please enter a email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'please enter a password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'please enter 6 digits password', context);
                } else {
                  Map data ={
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };

                  authViewMode.loginApi(data, context);
                  print('api hit');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
