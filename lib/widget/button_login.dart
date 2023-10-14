import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;
  final Color textColor;
  final Image? icon;

  const AppButton({
    super.key,
    required this.title,
    required this.color,
    this.onPressed,
    required this.textColor,
     required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 360,
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff73AB6B), //                   <--- border color
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon,
            ) ,
            Text(
              title, style: TextStyle(color: textColor, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
