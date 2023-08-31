
import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
 late final _controler = TextEditingController();
  final String? title;
  final Icon? icon;
  final bool isShow;

   TextFieldApp({
    super.key,
     required this.title,
     required this.icon,
    required this.isShow,
  });


  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: 340,
      child: TextFormField(

        controller: _controler,
        obscureText: isShow,
        decoration:  InputDecoration(
          labelText: title,
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: icon ,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 3, color: Colors.grey), //<-- SEE HERE
          ),
        ),
      ),
    );
  }
}
