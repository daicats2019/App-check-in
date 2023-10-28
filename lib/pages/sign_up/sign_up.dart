import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../route/routname.dart';
import '../../untils/color.dart';
import '../../untils/media_manager.dart';
import '../../user_auth/firebase_auth_service.dart';
import '../../widget/button_login.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {


  final FirebaseAuthService _auth = FirebaseAuthService();


  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Form(
                  key: _keyform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sing Up for Better Experience',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 340,
                        child: TextFormField(
                          controller: controllerName,
                          onFieldSubmitted: (value) {
                            _keyform.currentState!.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full name can\'t be empty';
                            }
                            // RegExp fullNameExp =
                            //     RegExp('^[A-Z][a-z]+\s[a-zA-Z\s\.]+');
                            // if (!fullNameExp!.hasMatch(value)) {
                            //   return 'Your full name is invalid';
                            // }
                          },
                          onSaved: (value) {
                            print(value);
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Enter Name',
                            prefixIcon: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(Icons.person),
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
                        width: 340,
                        child: TextFormField(
                          controller: controllerEmail,
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
                        width: 340,
                        child: TextFormField(
                          controller: controllerPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            RegExp passwordExp = RegExp(
                                '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,18}\$');
                            if (!passwordExp!.hasMatch(value)) {
                              return 'Your password phone is invalid';
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
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed:  _signUp,
                        child: Container(
                          width: 360,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff73AB6B),
                                //                   <--- border color
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff73AB6B)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16)),
                              TextSpan(
                                  text: ' Sing In!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff73AB6B),
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppButton(
                        title: 'Google',
                        color: Colors.white,
                        textColor: Colors.black,
                        icon: Image.asset(MediaManager.icGoogle),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }

 void _signUp() async {
      String username = controllerName.text;
      String email  = controllerEmail.text;
      String password = controllerPassword.text;



        print(
            '${controllerName.text} \n ${controllerEmail.text} \n ${controllerPassword.text}');
        if (_keyform.currentState!.validate()) {
          _keyform.currentState!.save();
          User? user = await _auth.signUpWithEmailAndPassword(email, password);

          if(user != null) {
            print('User is succeede full');
             // showDialog(
             //    context: context,
             //    builder: (context) => AlertDialog(
             //      backgroundColor: AppColors.white,
             //      actions: [  const SizedBox(
             //        height: 10,
             //      ),
             //        InkWell(
             //            onTap: (){
             //              Navigator.pop(context);
             //            },
             //            child: Icon(Icons.close,color: Colors.red,)),
             //        const Padding(
             //          padding: EdgeInsets.only(top: 10),
             //          child: Text(
             //            'Your regiistetion is completed...',
             //            style: TextStyle(
             //                fontWeight: FontWeight.w300,
             //                fontSize: 18,
             //                color: AppColors.black),
             //          ),
             //        ),
             //        const SizedBox(
             //          height: 20,
             //        ),
             //        Center(
             //            child: Image.asset(
             //                'assets/images/check.png')),
             //        const SizedBox(
             //          height: 20,
             //        ),
             //        const Center(
             //          child: Text(
             //            'Wait for verification! After verify you will get a email.',
             //            style: TextStyle(
             //                fontWeight: FontWeight.w300,
             //                fontSize: 18,
             //                color: AppColors.black),
             //          ),
             //        )
             //      ],
             //    ));

            // Future.delayed(const Duration(seconds: 1), () {
            //   Navigator.pushNamed(context, RouteNamePage.loginpage);
            // });

            Navigator.pushNamed(context, RouteNamePage.signOutPAge);
          } else {
            print('Some error');
          }
        }

  }
 
}
