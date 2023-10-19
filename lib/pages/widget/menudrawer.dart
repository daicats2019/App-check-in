import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawwer extends StatefulWidget {

  const MenuDrawwer({
    super.key,
    required this.icon,
    this.onpress,
    required this.title
  });

  final IconData icon;
  final String title;
  final VoidCallback? onpress;
  @override
  State<MenuDrawwer> createState() => _MenuDrawwerState();
}

class _MenuDrawwerState extends State<MenuDrawwer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(widget.icon),
          Text(
              widget.title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.black
              )
          )
        ],
      ),
    );
  }
}
