import 'package:app_check_in/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../route/routname.dart';
import '../../untils/media_manager.dart';
import '../../widget/button_login.dart';
import '../../widget/normal_textfield.dart';
import 'bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: SafeArea(child: Builder(builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener

              if (state is AuthLoginSuccess) {
                Navigator.pushNamed(context, RouteNamePage.homePage);
                return;
              }
              if (state is AuthLoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('LOGIN FAILURE, PLEASE TRY AGAIN!'),
                ));
                return;
              }
            },
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
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Form(
                      key: _keyform,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 370,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email can\'t be empty';
                                }
                                RegExp emailExp = RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if (!emailExp!.hasMatch(value)) {
                                  return 'Your Email is invalid';
                                }
                              },
                              onSaved: (value) {
                                print(value);
                              },
                              obscureText: false,
                              decoration: const InputDecoration(
                                labelText: 'Enter Email',
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Icon(Icons.mail),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.grey), //<-- SEE HERE
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 370,
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password can\'t be empty';
                                }

                              },
                              onSaved: (value) {
                                print(value);
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Enter Password',
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Icon(Icons.lock_rounded),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.grey), //<-- SEE HERE
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

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
                      onPressed: () => _signIn(context),
                    ),
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
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();

                        Navigator.pushNamed(context, RouteNamePage.homePage);
                      },
                      title: 'Google',
                      color: Colors.white,
                      textColor: Colors.black,
                      icon: Image.asset(MediaManager.icGoogle),
                    )
                  ]),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    print('START LOGIN EVENT');
    //TODO: Validate the form before call sign-in event
    // if(_keyform.currentState!.validate()) {
    //
    // } else {
    //   print('Some error');
    // }

    context.read<AuthBloc>().add(AuthLoginEvent(
        userName: _emailController.text, password: _passwordController.text));
    print('START ActivityTodayEvent');
    context.read<AuthBloc>().add(ActivityTodayEvent(
        token: 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3Mjk0OTY5MjMsInVzZXJfaWQiOjEwLCJ1c2VybmFtZSI6InF1b2N2aWV0MTIzQGdtYWlsLmNvbSJ9.yAz2uItTmD5OmBwsbSmZap1LJX43zsW61zKbAf6e7iGxAJ_Oh_6PeSYBOB8fpbrqqpNDmDgVOebvEVdV0fBM8Q'));


  }
}