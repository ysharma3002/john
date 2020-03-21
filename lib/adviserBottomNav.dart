

import 'dart:core';


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stableapp/adviserSupport.dart';
import 'package:stableapp/support.dart';
import 'package:stableapp/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


import 'adviserDashboard.dart';
import 'adviserMeeting.dart';


void main() {
  runApp(new MaterialApp(
    home: new adviserBottomNavState(),
  ));
}

class adviserBottomNavState extends StatefulWidget{

  @override
  adviserBottomNav createState() => adviserBottomNav();


}




class adviserBottomNav extends State<adviserBottomNavState>{





  int currentPage = 0;



  List<Widget> screens = [

  ];


  List<Color> currentColor = [

    Colors.transparent,
    Colors.transparent,
    Colors.transparent

  ];


  @override
  Widget build(BuildContext context) {

    screens=[
      adviserDashboard(),
      adviserMeeting(),
      adviserSupportState(),
    ];

    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: CurvedNavigationBar(


        backgroundColor: currentColor[currentPage],
        buttonBackgroundColor: Colors.black,
        color: Colors.black,
        index: 0,
        items: <Widget>[
          Icon(Icons.add, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white,),
          Icon(Icons.compare_arrows, size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },

      ),


      backgroundColor: Colors.white,
    );
  }






}
