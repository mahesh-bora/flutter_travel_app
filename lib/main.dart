import 'package:flutter/material.dart';
import 'package:flutter_travelapp/pages/booking.dart';
import 'package:flutter_travelapp/pages/details_page.dart';
import 'package:flutter_travelapp/pages/homepage.dart';
import 'package:flutter_travelapp/pages/navpages/main_page.dart';
import 'package:flutter_travelapp/pages/thank_you_page.dart';
import 'package:flutter_travelapp/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel App',
          routes:{
            "/":(context)=> WelcomePage(),
            "homepage":(context)=> HomePage(),
            "detailspage": (context) => DetailPage(),
            "mainpage": (context) => MainPage(),
            "thankyoupage": (context) => ThankYouPage(),
            "bookingpage": (context) => BookingPage(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}

