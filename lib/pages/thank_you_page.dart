import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travelapp/pages/navpages/main_page.dart';
import 'package:flutter_travelapp/pages/welcome.dart';
import 'package:flutter_travelapp/widgets/app_large_text.dart';
import '../misc/colors.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: TextButton(
          onPressed: () async {
            var message = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
          },
          child: Container(
              margin: EdgeInsets.only(right: 20, left: 10),

              height: 200,
              width: 5000,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLargeText(text: "We are Under Development", color: Colors.black54,size: 27,),
                ],
              )),
        ),
      ),
    );
  }
}
