import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/button_login.dart';
import '../widget/normal_textfield.dart';
import '../widget/text_fiel.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _designationController = TextEditingController();
  final _departmentController = TextEditingController();
  final _teamNameController = TextEditingController();
  final _supervisedByController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  void dispose() {
    _departmentController.dispose();
    _designationController.dispose();
    _teamNameController.dispose();
    _supervisedByController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/user.png'),
                    Text(
                      "Update profile",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                  ],
                ),

              ),
            ),
            SizedBox(height: 20,),
            NormalTextfeild(title: 'Designation', isShow: false,controler: _designationController,),
            SizedBox(height: 10,),
            NormalTextfeild(title: 'Department', isShow: false,controler: _departmentController,),
            SizedBox(height: 10,),

            NormalTextfeild(title: 'Team Name', isShow: false,controler: _teamNameController,),
            SizedBox(height: 10,),

            NormalTextfeild(title: 'Supervised By', isShow: false,controler: _supervisedByController,),
            SizedBox(height: 10,),
            NormalTextfeild(title: 'Phone Number', isShow: false,controler: _phoneController,),
            SizedBox(height: 40,),
            AppButton(title: 'Update', color: Color(0xff73AB6B), textColor: Colors.white, icon: null,),
          ],
        ),
      ),
    );
  }
}