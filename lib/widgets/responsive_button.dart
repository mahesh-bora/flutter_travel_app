import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travelapp/widgets/app_text.dart';
import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key,this.width, this.isResponsive = false}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Container(
  width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin:EdgeInsets.only(left: 12),child: AppText(text: "Book Trip Now", color: Colors.white,)):Container(),
            Image.asset("lib/img/button-2.png")

          ],
        ),
      ),
    );
  }
}
