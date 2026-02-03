import 'package:flutter/material.dart';
import 'package:providers_app/respository/components/round_button.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/utils/utils.dart';
import 'package:providers_app/view/home_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
FocusNode emailFocusNode = FocusNode();
FocusNode passwordFocusNode = FocusNode();


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(appBar: AppBar(
      title: Text('Login'),
      centerTitle: true,
    ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                hintText: 'Email@gmail.com',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),

              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
          ValueListenableBuilder<bool>(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {




          return TextFormField(
              controller: _passwordController,
                obscureText: _obsecurePassword.value,
              focusNode:passwordFocusNode,
              obscuringCharacter: '*',
              decoration:  InputDecoration(
                  hintText: 'P@123',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password_sharp),
                suffixIcon: InkWell(
                  onTap: (){
                    _obsecurePassword.value = !_obsecurePassword.value;



                  },


                  child:  Icon(
                      _obsecurePassword.value ? Icons.visibility_off_outlined:
                  Icons.visibility),
                ),

              ),
            );
          },
          ),
            SizedBox(height:height*.085,
            ),
            RoundButton(
              title: 'login',
                onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('please enter a email', context);

                }else if( _passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('please enter a password', context);
                }else if(_passwordController.text.length< 6) {
                  Utils.flushBarErrorMessage('please enter 6 digits paswword ', context);

                }
                else{
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
