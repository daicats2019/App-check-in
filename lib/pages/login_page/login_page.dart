import 'package:app_check_in/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../route/routname.dart';
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
                  NormalTextfeild(
                    title: 'Email',
                    isShow: false,
                    controler: _emailController,
                  ),
                  const SizedBox(
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
                    icon: Image.asset('assets/images/icon_google.png'),
                  )
                ]),
              ],
            ),
          );
        })),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    print('START LOGIN EVENT');
    //TODO: Validate the form before call sign-in event

    context.read<AuthBloc>().add(AuthLoginEvent(
        userName: _emailController.text, password: _passwordController.text));
  }
}
