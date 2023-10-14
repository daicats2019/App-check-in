import 'package:app_check_in/Page/widget/drawer_header.dart';
import 'package:app_check_in/Page/widget/drawerbody.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../route/routname.dart';
import '../widget/button_login.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final List<String> items = [
    'HCM',
    'HN',
    'DN',
    'CT',
  ];
  String? selectedValue;
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding =  DateTime(2023, 7, 20, 20, 17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHead(),
                DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Home',
                ),
                DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Issues',
                ),
                DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Incident',
                ),
                DrawerButtonBody(
                  imaged: 'assets/images/subtract.png',
                  title: 'Leaves',
                ),
                DrawerButtonBody(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
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
              SizedBox(
                height: 100,
              ),
               Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/subtract.png'),
                    ),
                    const Text('Location : ',
                        style: TextStyle(color: Colors.black, fontSize: 22,)),
                    const Text('Set Your Location:',
                        style: TextStyle(color: Colors.black, fontSize: 22)),
                  ],
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 60,
                    width: 360,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: 360,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
               AppButton(
                title: 'Submit',
                color: Color(0xff73AB6B),
                textColor: Colors.white,
                icon: null,
                onPressed: (){
                  Navigator.pushNamed(context, RouteNamePage.homeCheckIn);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
