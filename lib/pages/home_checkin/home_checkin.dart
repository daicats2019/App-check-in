

import 'package:app_check_in/pages/widget/drawer_header.dart';
import 'package:app_check_in/pages/widget/drawerbody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import '../../model/locations.dart' as locations;
import '../../route/routname.dart';
import '../../untils/media_manager.dart';
import 'bloc/checktime_bloc.dart';

class Homecheck extends StatefulWidget {
  const Homecheck({Key? key}) : super(key: key);

  @override
  State<Homecheck> createState() => _HomecheckState();
}

class _HomecheckState extends State<Homecheck> {
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding = DateTime(2023, 7, 20, 20, 17);

// Map
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  void initState() {
    loadDataSharePreference();

    super.initState();
  }

  Future<void> loadDataSharePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var action = prefs.getString('token') ?? '';
    print('Get InFo Actitvity ACtion 123');
    context.read<ChecktimeBloc>().add(ActivityEvent(token: action));
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
        child: Builder(
          builder: (context) {
            return BlocListener<ChecktimeBloc, ChecktimeState>(
              listener: (context, state) async  {
                // TODO: implement listener
                if (state is CheckTimeSucces)  {
                    print('${state.data.checked_out_at}LOLOLO');
                  return;
                }

              },
              child: Column(
                children: [
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
                  SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.yellow,
                        ),
                        Text('Status:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        Text('You are not in office range:',
                            style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: const CameraPosition(
                          target:
                          LatLng(10.756677984723682, 106.6436044925458),
                          zoom: 20,
                        ),
                        markers: {
                          Marker(
                            position: const LatLng(
                                10.756677984723682, 106.6436044925458),
                            infoWindow: InfoWindow(
                                title: 'Drag and hold this to location!'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed,
                            ),
                            markerId: MarkerId('1'),
                          )
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNamePage.selectLocation);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(MediaManager.icSubtract),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 300,
                          child: Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Your Location:',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ' Block C, 24/A ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      )),
                                  TextSpan(
                                      text:
                                      '  Tajmahal Road (Ring Road, Near ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      )),
                                  TextSpan(
                                      text: '  Shia Mosque, Dhaka 1207:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  BlocBuilder<ChecktimeBloc, ChecktimeState>(
                      builder: (context, actionState) {
                        if(actionState is CheckTimeSucces){
                          print('LALALA1${actionState.data.is_check_in_late}');
                          String? timeCheckIn = actionState.data.checked_in_at;
                          String? timeCheckOut = actionState.data.checked_out_at;
                          DateTime dateTimeOut = DateTime.parse(timeCheckOut!);
                          DateTime dateTimeIn = DateTime.parse(timeCheckIn!);


                          return  Container(
                              width: 290,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(

                                    children: [
                                      actionState.data.is_check_in_late == true ?
                                      const Icon(
                                        Icons.access_time,
                                        color: Colors.red,
                                        size: 50,
                                      ) :   const Icon(
                                        Icons.access_time,
                                        color: Colors.green,
                                        size: 50,
                                      ),

                                     Text(
                                          '${DateFormat('hh:mm ').format(dateTimeIn)}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )),

                                      const Text('Check in',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Column(
                                      children: [
                                        actionState.data.is_check_out_early == false ?
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.red,
                                          size: 50,
                                        ) :   const Icon(
                                          Icons.access_time,
                                          color: Colors.green,
                                          size: 50,
                                        ),
                                        actionState.data.checked_out_at == null ?
                                        const Text(
                                            '-- --',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            )) :
                                        Text(
                                            '${DateFormat('hh:mm ').format(dateTimeOut)}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            )) ,

                                        const Text('Check out',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.green,
                                        size: 50,
                                      ),
                                      Text(
                                          '${DateFormat('hh:mm ').format(moonLanding)}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      const Text('Working Hr’ s',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                ],
                              ));
                        }
                        return SizedBox();
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
