import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../untils/media_manager.dart';

  class DrawerHead extends StatefulWidget {
  const DrawerHead({super.key});

  @override
  State<DrawerHead> createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff73AB6B),
      height: 200,
      width: double.infinity,
      child: Column(
      children: [
        SizedBox(height: 30,),
        Image.asset(MediaManager.icAvatar),
        SizedBox(height: 10,),
        const Text(
            "Hi! Kabir",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Colors.white
            )
        )
      ]),
    );
  }
}
