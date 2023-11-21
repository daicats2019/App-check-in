import 'package:app_check_in/pages/widget/drawer_header.dart';
import 'package:app_check_in/pages/widget/drawerbody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route/routname.dart';
import '../../untils/media_manager.dart';
import '../home_checkin/bloc/checktime_bloc.dart';
import '../login_page/bloc/auth_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding = DateTime(2023, 7, 20, 20, 17);
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  @override
  void initState() {
    loadDataSharePreference();
    // getCurrentLocation();
    super.initState();
  }

  Future<void> loadDataSharePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var action = prefs.getString('token') ?? '';
    print('MIMIMI');
    context.read<ChecktimeBloc>().add(ActivityEvent(token: action));
  }

//   void getCurrentLocation() async {
//
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location denied");
//       }
//
//       print('CACACACA3');
// // Lấy vị trí hiện tại của người dùng
//       Position userPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       print('${userPosition}CACACACA5');
// // Lấy thông tin tọa độ
//       double officeLatitude = 10.756677984723682;
//       double officeLongitude = 106.6436044925458;
//       // Tạo một tọa độ từ vị trí của văn phòng
//       // Location officeLocation = Location(officeLatitude, officeLongitude);
//
//       print('CACACACA4');
// // Sử dụng phương thức distanceBetween để tính khoảng cách giữa hai tọa độ
//       double distance = await Geolocator.distanceBetween(
//         userPosition.latitude,
//         userPosition.longitude,
//         officeLatitude,
//         officeLongitude,
//       );
//       bool isWithin200Meters = distance < 200.0;
//       if (isWithin200Meters) {
//         print("Người dùng cách văn phòng ít hơn 200m.");
//       } else {
//         print("Người dùng cách văn phòng hơn hoặc bằng 200m.");
//       }
//       print('${distance} CACACACA1');
//     }
//   }

  @override
  Widget build(BuildContext context) {
    print('VAVAVA123');
    return Scaffold(
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHead(),
                const DrawerButtonBody(
                  imaged: MediaManager.icSubtract,
                  title: 'Home',
                ),
                const DrawerButtonBody(
                  imaged: MediaManager.desk,
                  title: 'Issues',
                ),
                const DrawerButtonBody(
                  imaged: MediaManager.deskAlt,
                  title: 'Incident',
                ),
                const DrawerButtonBody(
                  imaged: MediaManager.noteBook,
                  title: 'Leaves',
                ),
                const DrawerButtonBody(
                  imaged: MediaManager.isBag,
                  title: 'Change password',
                ),
                DrawerButtonBody(
                  imaged: MediaManager.signOut,
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
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            print('CACACACA34');
            // TODO: implement listener
                if (state is CheckedIn) {
                  print('CACACACA3');

                  LocationPermission permission;
                  permission = await Geolocator.checkPermission();

                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();

                    if (permission == LocationPermission.denied) {
                      return Future.error("Location denied");
                    }

                    print('CACACACA3');
// Lấy vị trí hiện tại của người dùng
                    Position userPosition =
                        await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);
                    print('${userPosition}CACACACA5');
// Lấy thông tin tọa độ
                    double officeLatitude =
                        state.data.office?.latitude ?? 0.0;
                    double officeLongitude =
                        state.data.office?.longitude ?? 0.0;
                    print('${officeLatitude}LOLOLOLO1');
                    print('${officeLongitude}LOLOLOLO1');
                    // Tạo một tọa độ từ vị trí của văn phòng
                    // Location officeLocation = Location(officeLatitude, officeLongitude);

                    print('CACACACA4');
// Sử dụng phương thức distanceBetween để tính khoảng cách giữa hai tọa độ
                    double distance = await Geolocator.distanceBetween(
                      userPosition.latitude,
                      userPosition.longitude,
                      officeLatitude,
                      officeLongitude,
                    );
                    bool isWithin200Meters = distance < 200.0;
                    if (isWithin200Meters) {
                      print("Người dùng cách văn phòng ít hơn 200m.");
                    } else {
                      print("Người dùng cách văn phòng hơn hoặc bằng 200m.");
                    }
                    print('${distance} CACACACA1');
                  }
                }
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
                      DateFormat('EEEE, MMM dd').format(now),
                      // Format the current date
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
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            print('START ActivityAcrionEvent');
                            // Obtain shared preferences.
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            var action = prefs.getString('token') ?? '';
                            context.read<AuthBloc>().add(
                                ActivityAcrionEvent(
                                    isCheckIn: true, token: action));
                          },
                          child: Container(
                            color: Color(0xff73AB6B),
                            height: 150,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/hand_left.png'),
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
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            var action = prefs.getString('token') ?? '';
                            print('${action} KIKIKIKI2');
                            context
                                .read<AuthBloc>()
                                .add(ActivityAcrionEvent(
                                  isCheckIn: false,
                                  token: action,
                                ));
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
        ),
      ),
    );
  }
}
