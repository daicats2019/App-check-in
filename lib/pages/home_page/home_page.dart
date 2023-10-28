import 'package:app_check_in/pages/sign_up/sign_up.dart';
import 'package:app_check_in/pages/widget/drawer_header.dart';
import 'package:app_check_in/pages/widget/drawerbody.dart';
import 'package:app_check_in/pages/widget/menudrawer.dart';
import 'package:app_check_in/model/timeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route/routname.dart';
import '../../untils/app_database.dart';
import '../login_page/bloc/auth_bloc.dart';
import '../login_page/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding =  DateTime(2023, 7, 20, 20, 17);
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  //
  Future<void> loadDataSharePreference()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final currentTimeCheckin = prefs.getInt('DateTime'?? '');
    print('${currentTimeCheckin}OKOKOKOK');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHead(),
                const DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Home',
                ),
                const DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Issues',
                ),
                const DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Incident',
                ),
                const DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Leaves',
                ),
                const DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Change password',
                ),
                DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Log out',
                  onpress: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff73AB6B),
      ),
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
      child: SafeArea(

        child: Builder(builder: (context){
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // TODO: implement listener


            },
          child: Column(
            children: [
              const Center(
                  child: Text("Hi Kabir Ahmed!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ))),
              Center(
                child: Column(
                  children: [
                    Text('${DateFormat('hh:mm a').format(moonLanding)}',
                        style: const TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                      DateFormat('EEEE, MMM dd').format(now), // Format the current date
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context,state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            print('START ActivityAcrionEvent');
                            // Obtain shared preferences.
                            context.read<AuthBloc>().add(ActivityAcrionEvent(
                                is_check_in: true, token: '', action: ''));


                            Navigator.pushNamed(context, RouteNamePage.homeCheckIn);
                          },
                          child: Container(
                            color: Color(0xff73AB6B),
                            height: 150,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/hand_left.png'),
                                const Text("In",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNamePage.checklocation);
                          },
                          child: Container(
                            color: Color(0xff414042),
                            height: 150,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/hand_right.png',
                                  color: Colors.white,
                                ),
                                const Text("Out",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          );
        },),
      ),
      ),
    );
  }
}
