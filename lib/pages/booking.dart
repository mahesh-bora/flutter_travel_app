import 'package:flutter/material.dart';
import 'package:flutter_travelapp/pages/welcome.dart';
import '../misc/colors.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: TextButton(
          onPressed: () async {
            var message = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return WelcomePage();
                }));
          },
          child: Container(
              margin: EdgeInsets.only(right: 20, left: 10),

              height: 200,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/img/done.gif",
                    ),
                    fit: BoxFit.cover,
                  )

              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              )),
        ),
      ),
    );
  }
}
