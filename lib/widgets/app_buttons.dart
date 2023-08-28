import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travelapp/misc/colors.dart';
import 'package:flutter_travelapp/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color backgroundcolor;
  double size;
  final Color borderColor;
  AppButtons({super.key,
    this.isIcon = false,
    this.text="1",
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundcolor,
    required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor,
      ),
      child: isIcon == false?Center(child: AppText(text: text!, color: color)):Center(child: Icon(icon, color: color,)),
    );
  }
}
