import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/routname.dart';
import '../widget/button_login.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: AppButton(title: 'Sign out',
            color: Colors.blue,
            textColor: Colors.white,
            icon: null,
            onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, RouteNamePage.loginpage);
        }),
      ),
    );
  }
}
