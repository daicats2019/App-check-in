
import 'package:app_check_in/untils/media_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../route/routname.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../model/locations.dart' as locations;
import '../widget/drawer_header.dart';
import '../widget/drawerbody.dart';

class CheckLocation extends StatefulWidget {
  const CheckLocation({Key? key}) : super(key: key);

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {
  //Datetime
  final now = DateTime.now();
  final berlinWallFell = DateTime(1989, 11, 9);
  final moonLanding = DateTime(2023, 7, 20, 20, 17);

// Map
  String google_api_key = "AIzaSyB7_bwb0nAsXvNMjh1bzOpzZd24M3AXVXc";

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

  // location
  static const LatLng homeLocation =
      LatLng(10.756677984723682, 106.6436044925458);
  static const LatLng companyLocation =
      LatLng(10.758648629639435, 106.64410138612888);
  static const LatLng company2Location =
      LatLng(10.756134326385675, 106.64666693633853);

  List<LatLng> polyLineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(homeLocation.latitude, homeLocation.longitude),
      PointLatLng(companyLocation.latitude, companyLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polyLineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {

      });
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cancel booking'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to cancel the booking?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNamePage.selectLocation);
                },
              ),
            ],
          );
        },
      );
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
                 DrawerButtonBody(
                  imaged: MediaManager.icSubtract,
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
                    Text('You are not in the office range:',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(10.75667798472368, 106.6436044925458),
                      zoom: 15,
                    ),
                    polylines: {
                      Polyline(
                        polylineId: PolylineId('route'),
                        points: polyLineCoordinates,
                        color: Colors.red,
                        width: 6,
                      ),
                    },
                    markers: {
                      Marker(
                        position: homeLocation,
                        infoWindow: InfoWindow(
                            title: 'Drag and hold this to location!'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                        markerId: MarkerId('1'),
                      ),
                      Marker(
                        position: companyLocation,
                        infoWindow: InfoWindow(
                            title: 'Drag and hold this to location!'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                        markerId: MarkerId('2'),
                      ),
                      Marker(
                        position: company2Location,
                        infoWindow: InfoWindow(
                            title: 'Drag and hold this to location!'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                        markerId: MarkerId('3'),
                      )
                    }),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNamePage.selectLocation);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Image.asset('assets/images/subtract.png'),
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
                                  text: '  Tajmahal Road (Ring Road, Near ',
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
              Container(
                width: 280,
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Note: Please go inside the office range and',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20)),
                      TextSpan(
                        text: ' try again!',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
