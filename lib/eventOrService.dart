import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

import 'intro.dart';


class eventOrServiceState extends StatefulWidget{

  @override
  eventOrService createState() => eventOrService();


}



class eventOrService extends State<eventOrServiceState>{

  TextEditingController nameController;

  String dropdownValueEvent = '3-D Animation';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }




  @override
  Widget build(BuildContext context) {


    final controller = PageController(
      initialPage: 0,
    );



    var pageView = PageView(
        controller: controller,
        children: <Widget>[

          eventForm(),
          serviceForm()

        ],
        onPageChanged: (int page){}
    );




    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[

          Row(
            children: <Widget>[

              SafeArea(
                child: new ButtonTheme(

                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  height: 40,

                  child: FlatButton(
                      color: Colors.white,
                      child: Container(
                        child:  Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                  ),

                ),
              )


            ],
          ),

          Expanded(
            child: pageView,
          ),

          AspectRatio(
            aspectRatio: 11/2,
            child: Container(
              child: WormIndicator(
                indicatorColor: Colors.red,
                length: 2,
                controller: controller,
                shape: Shape(
                    size: 16,
                    spacing: 8,
                    shape: DotShape.Circle
                ),
              ),
            ),

          )


        ],
      ),
    );
  }




  eventForm(){
    return Stack(
      children: <Widget>[

        Scaffold(
          backgroundColor: Colors.white,
        ),

        Container(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('image/messageBackground.png'),
          ),
        ),


        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Icon(Icons.receipt,color: Colors.white,),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text('Competitive Event Form', style: TextStyle(fontSize: 20, color: Colors.white),),
                  )
                ],
              ),


              Container(
                color: Colors.white,
                height: 350,
                width: 350,
                child: Column(
                  children: <Widget>[

                    Container(
                      child: Text('Name:',style: TextStyle(fontSize: 17),),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: TextField(
                        controller: nameController,

                        textAlign: TextAlign.left,
                        decoration: new InputDecoration(
                            hoverColor: Colors.orange,
                            focusColor: Colors.orange,

                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey),
                            hintText: "Your Full Name",
                            fillColor: Colors.white70),
                      ),
                    ),


                    Container(
                      child: Text('Competitive Event:',style: TextStyle(fontSize: 17),),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      child: typeFieldWidgetEvent()
                    ),

                    new ButtonTheme(

                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),


                        height: 50,
                        minWidth: 300,
                        child: Container(
                          padding: EdgeInsets.only(left: 10,right: 10, top: 25),
                          child: RaisedButton(
                              child: Text('Submit',style: TextStyle(fontSize: 17, color: Colors.white),),
                              color: Colors.deepOrange,

                              onPressed: (){

                                Firestore.instance.collection('competitiveEvent').document(nameController.text).setData({'event' : dropdownValueEvent});

                                Fluttertoast.showToast(
                                    msg: "Submitted!",
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black
                                );
                              }
                          ),
                        )

                    ),




                  ],
                ),
              )


            ],
          ),
        )




      ],
    );
  }





  serviceForm(){
    return Stack(
      children: <Widget>[

        Scaffold(
          backgroundColor: Colors.white,
        ),

        Container(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('image/messageBackground.png'),
          ),
        ),


        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Icon(Icons.receipt,color: Colors.white,),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text('Community Service Form', style: TextStyle(fontSize: 20, color: Colors.white),),
                  )
                ],
              ),


              Container(
                color: Colors.white,
                height: 350,
                width: 350,
                child: Column(
                  children: <Widget>[

                    Container(
                      child: Text('Name:',style: TextStyle(fontSize: 17),),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: TextField(

                        textAlign: TextAlign.left,
                        decoration: new InputDecoration(
                            hoverColor: Colors.orange,
                            focusColor: Colors.orange,

                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey),
                            hintText: "Your Full Name",
                            fillColor: Colors.white70),
                      ),
                    ),


                    Container(
                      child: Text('Community Service Event:',style: TextStyle(fontSize: 17),),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButton<String>(
                        hint: Text('Choose an event'),
                        items: <String>['Street Cleanup', 'March of Dimes', 'Chick-fil-A Fundraising', 'Toys for Tots'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {
                        },
                      ),
                    ),

                    new ButtonTheme(

                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),


                        height: 50,
                        minWidth: 300,
                        child: Container(
                          padding: EdgeInsets.only(left: 10,right: 10, top: 25),
                          child: RaisedButton(
                              child: Text('Submit',style: TextStyle(fontSize: 17, color: Colors.white),),
                              color: Colors.deepOrange,

                              onPressed: (){
                                Navigator.of(context).pop();
                              }
                          ),
                        )

                    ),




                  ],
                ),
              )


            ],
          ),
        )




      ],
    );
  }

  Widget typeFieldWidgetEvent() {

    return DropdownButton<String>(
      value: dropdownValueEvent,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
          fontSize: 15,
          color: Colors.black
      ),
      underline: Container(
        height: 2,
        color: Colors.deepOrange,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValueEvent = newValue;
        });
      },
      items: <String>['3-D Animation', 'Accounting I', 'Accounting II', 'Advertising', 'Agribusiness', 'Banking & Financial Systems', 'Broadcast Journalism', 'Business Calculations', 'Business Communication', 'Business Ethics', 'Business Financial Plan', 'Business Law', 'Business Plan', 'Client Service', 'Coding & Programming', 'Computer Applications', 'Computer Game & Simulation Programming', 'Computer Problem Solving', 'Cyber Security', 'Database Design & Applications', 'Digital Video Production', 'E-business', 'Economics', 'Electronic Career Portfolio', 'Emerging Business Issues', 'Entrepreneurship', 'Future Business Leader', 'Global Business', 'Graphic Design', 'Health Care Administration', 'Help Desk', 'Hospitality Management (FBLA)', 'Impromptu Speaking (FBLA)', 'Insurance & Risk Management', 'Introduction to Business', 'Introduction to Business Communication', 'Introduction to Business Presentation', 'Introduction to Business Procedures', 'Introduction to FBLA', 'Introduction to Financial Math', 'Introduction to Information Technology', 'Introduction to Parliamentary Procedure', 'Introduction to Public Speaking', 'Job Interview (FBLA)', 'Journalism', 'LifeSmarts', 'Management Decision Making', 'Management Information Systems', 'Marketing', 'Mobile Application Development (FBLA)', 'Network Design (FBLA)', 'Networking Concepts (FBLA)', 'Organizational Leadership', 'Parliamentary Procedure (FBLA)', 'Personal Finance (FBLA)', 'Political Science', 'Public Service Announcement', 'Public Speaking (FBLA)', 'Publication Design', 'Sales Presentation (FBLA)', 'Securities & Investments', 'Social Media Campaign', 'Sports & Entertainment Management', 'Spreadsheet Applications', 'Virtual Business Finance Challenge', 'Virtual Business Management Challenge', 'Website Design (FBLA)', 'Word Processing']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );

  }



}