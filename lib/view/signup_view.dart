import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import '../respository/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';



class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberCOntroller = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _phoneNumberCOntroller.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    fullNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextFormField(
              controller: _fullnameController,

              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Fullname',
                labelText: 'Name',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),   TextFormField(
              controller: _emailController,
              
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
            ),   TextFormField(
              controller: _phoneNumberCOntroller,

              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Number',
                labelText: 'Number',
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
              title: 'Sign Up',
              loading: authViewMode.signUpLoading,
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
                    "email":_emailController.text,
                    "password": _passwordController.text,
                    "full_name": _fullnameController.text,
                    "phone_number": _phoneNumberCOntroller.text
                  };

                  authViewMode.signUpApi(data, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(height: height * .02,),
            InkWell(onTap: (){
              Navigator.pushNamed(context, RoutesName.login);
            }   ,
                child: Text("Already have an account ? Login"))
          ],
        ),
      ),
    );
  }
}

