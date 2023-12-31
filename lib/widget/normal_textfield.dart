import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalTextfeild extends StatefulWidget {
  final ValueChanged<String>? onchanged;
  final ValueChanged<String?>? validate;
  final  TextEditingController? controler;
  final String? title;
  final Icon? icon;
  final bool isShow;

  NormalTextfeild({
    super.key,
    required this.title,
    required this.icon,
    required this.isShow,
     this.onchanged,
     this.controler,
    this.validate,
  });


  @override
  State<NormalTextfeild> createState() => _NormalTextfeildState();
}

class _NormalTextfeildState extends State<NormalTextfeild> {

  late final TextEditingController _controler;

  @override
  void initState() {
    _controler = widget.controler ?? TextEditingController();
    super.initState();
  }

  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: TextFormField(
        validator:(value) {
          widget.validate;
        },
        onChanged: (value) {
          widget.onchanged;
        },
        controller: _controler,
        obscureText: widget.isShow,
        decoration:  InputDecoration(
          labelText: widget.title,
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: widget.icon ,
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
