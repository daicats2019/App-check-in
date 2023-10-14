import 'dart:convert';

import 'package:app_check_in/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/mockdata.dart';
import '../model/user_model.dart';
import '../route/routname.dart';
import '../untils/service.dart';
import '../user_auth/firebase_auth_service.dart';
import '../widget/button_login.dart';
import '../widget/normal_textfield.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  //  Future<List<UserModel>> getDataUserServer() async {
  //    await Future.delayed(Duration(seconds: 5));
  //   var url = Uri(
  //     scheme: 'https',
  //     host: '64a6b44d096b3f0fcc805ffd.mockapi.io',
  //     path: '/check_in_app',
  //   );
  //   var respnse = await http.get(url);
  //
  //     print('${respnse.body} OKOKOKOK`');
  //   var listMap = jsonDecode(respnse.body) as List<dynamic>;
  //   List<UserModel> result = listMap.map((e) => UserModel.fromJson(e),).toList();
  //   return result;
  // }


  @override
  void initState() {

    super.initState();
  }

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
          child: FutureBuilder(
            future: UserService.getDataUserServer(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                return Column(
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
                            onPressed: (){
                              final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                              provider.googleLogin();

                              Navigator.pushNamed(context, RouteNamePage.homePage);
                            },
                            title: 'Google',
                            color: Colors.white,
                            textColor: Colors.black,
                            icon: Image.asset('assets/images/icon_google.png'),
                          )
                        ]

                    ),

                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }

            },

          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);


    mockData.forEach((e) {
      if(e.email == email && e.password == password ){
        print('User is susseede login');

        if(e.checkin ==true){
          Navigator.pushNamed(context, RouteNamePage.checklocation);
        } else {
          Navigator.pushNamed(context, RouteNamePage.homePage);
        }
      }else {
               print('Some error');
             }

      });



  }
}
