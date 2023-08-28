import 'package:flutter/material.dart';
import 'package:flutter_travelapp/misc/colors.dart';
import 'package:flutter_travelapp/pages/navpages/bar_item_page.dart';
import 'package:flutter_travelapp/pages/navpages/my_page.dart';
import 'package:flutter_travelapp/pages/navpages/search_page.dart';
import '../homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int cIndex = 0;
  void onTap(int index){
    setState(() {
      cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[cIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: AppColors.mainColor,
        currentIndex: cIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:("Home"),icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:("Bar"),icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:("Search"),icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:("My"),icon: Icon(Icons.person)),
        ],
      ),
    );;
  }
}

