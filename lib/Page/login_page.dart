import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/routname.dart';
import '../user_auth/firebase_auth_service.dart';
import '../widget/button_login.dart';
import '../widget/normal_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Image.asset('assets/images/banner_login.png'),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  NormalTextfeild(
                    title: 'Email',
                    isShow: false,
                    controler: _emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NormalTextfeild(
                      title: 'Password',
                      isShow: false,
                      controler: _passwordController),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  AppButton(
                      title: 'Log in',
                      color: Color(0xff73AB6B),
                      textColor: Colors.white,
                      icon: null,
                      onPressed: _signIn),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Don’t have an account?  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16)),
                        TextSpan(
                            text: ' Sing Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff73AB6B),
                                fontSize: 16)),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    title: 'Google',
                    color: Colors.white,
                    textColor: Colors.black,
                    icon: Image.asset('assets/images/icon_google.png'),
                  )
                ]

              ),

            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is susseede login');
      Navigator.pushNamed(context, RouteNamePage.homePage);
    } else {
      print('Some error');
    }
  }
}
