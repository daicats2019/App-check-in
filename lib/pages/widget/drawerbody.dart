import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerButtonBody extends StatelessWidget {
  const DrawerButtonBody({super.key,
    this.icon,
    this.onpress,
    required this.imaged,
    required this.title});


  final IconData? icon;
  final String imaged;
  final String title;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onpress,
        child: Container(

          width: 300,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
          ),
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset(imaged),
                Icon(icon,color: Colors.black,),
                SizedBox(width: 20,),
                Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,color: Colors.black,
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
