import 'package:app_check_in/Page/widget/drawer_header.dart';
import 'package:app_check_in/Page/widget/drawerbody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../route/routname.dart';
import '../model/locations.dart' as locations;


class Homecheck extends StatefulWidget {
  const Homecheck({Key? key}) : super(key: key);

  @override
  State<Homecheck> createState() => _HomecheckState();
}

class _HomecheckState extends State<Homecheck> {
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding =  DateTime(2023, 7, 20, 20, 17);

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
      body: SafeArea(
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
                    DateFormat('EEEE, MMM dd').format(now), // Format the current date
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            SizedBox(
              height: 200,
              child: GoogleMap(

                  onMapCreated: _onMapCreated,
                  initialCameraPosition:  const CameraPosition(
                    target: LatLng(10.756677984723682, 106.6436044925458),
                    zoom: 20,
                  ),
                  markers: {Marker(
                    position: const LatLng(
                        10.756677984723682, 106.6436044925458),
                    infoWindow: InfoWindow(title: 'Drag and hold this to location!'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ), markerId: MarkerId('1'),

                  )}
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteNamePage.selectLocation);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset('assets/images/subtract.png'),
                  ),
                  SizedBox(height: 40,),


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
                                    fontWeight: FontWeight.w700,color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: ' Block C, 24/A ',
                                style: TextStyle(color: Colors.black,fontSize: 20,
                                )
                            ),
                            TextSpan(
                                text: '  Tajmahal Road (Ring Road, Near ',
                                style: TextStyle(color: Colors.black,fontSize: 20,
                                )
                            ),
                            TextSpan(
                                text: '  Shia Mosque, Dhaka 1207:',
                                style: TextStyle(color: Colors.black,fontSize: 20,
                                )
                            )
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
            Container(
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.access_time,color: Colors.green,size: 50,),
                      Text('${DateFormat('hh:mm ').format(moonLanding)}',
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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        const Icon(Icons.access_time,color: Colors.green,size: 50,),
                        Text('${DateFormat('hh:mm ').format(moonLanding)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
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
                      Icon(Icons.access_time,color: Colors.green,size: 50,),
                      Text('${DateFormat('hh:mm ').format(moonLanding)}',
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
              )
            ),
          ],
        ),
      ),
    );
  }
}
