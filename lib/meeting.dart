

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'eventOrService.dart';


class meeting extends StatefulWidget{

  @override
  meetingState createState() => meetingState();


}

class meetingState extends State<meeting>{

  int x = 0;

  String date = 'Loading';
  String location = 'Loading';
  int members = 0;
  int membersPresent = 0;
  int membersSigned = 0;
  int membersAbsent = 0;

  
  @override
  Widget build(BuildContext context) {

    Firestore.instance.collection('meeting').document('meetingInfo')
        .get().then((DocumentSnapshot) {

      setState(() {
        date = DocumentSnapshot.data['date'].toString();
        location = DocumentSnapshot.data['location'].toString();
      });

    }
    );

    Firestore.instance.collection('meeting').document('membersInfo')
        .get().then((DocumentSnapshot) {

      setState(() {
        members = DocumentSnapshot.data['totalMembers'];
        membersPresent = DocumentSnapshot.data['membersPresent'];
        membersSigned = DocumentSnapshot.data['membersSignedUp'];
        membersAbsent= members-membersPresent;
      });

    }
    );


    return Scaffold(
      body: ListView(

        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(

                padding: EdgeInsets.only(left: 20),
                child: Text('Abhijit Singh', style: TextStyle(fontSize: 30, color: Colors.deepOrange,),),

              ),


              SafeArea(
                child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push<Widget>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => eventOrServiceState(),
                          ),
                        );
                      },
                      child: Icon(Icons.receipt),
                    )
                ),
              )

            ],

          ),

          Center(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Text('Next Meeting',style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),),

          ),


          AspectRatio(
            aspectRatio: 2,

            child: Container(
              padding: EdgeInsets.only(top:20.0),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(40.0),
                child: Container(

                  decoration: BoxDecoration(

                    //TODO: Add gradient colors here
                      gradient: LinearGradient(colors: [Color.fromRGBO(29, 50, 81, 1), Color.fromRGBO(252, 66, 30, 1)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Text(date,style: TextStyle(fontSize: 30, color: Colors.white,)),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(location,style: TextStyle(fontSize: 30, color: Colors.white,)),
                      )

                    ],

                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),


          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text('*Updated as of Last Meeting*', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Members', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                Text(members.toString(), style: TextStyle(fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),),

              ],
            ),
            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
          ),


          Container(
            child: Divider(
              thickness: 5,
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 30, right: 30),
          ),




          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Members Present', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                Text(membersPresent.toString(), style: TextStyle(fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),),

              ],
            ),
            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
          ),


          Container(
            child: Divider(
              thickness: 5,
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 30, right: 30),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Members Absent', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                Text(membersAbsent.toString(), style: TextStyle(fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),),

              ],
            ),
            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
          ),


          Container(
            child: Divider(
              thickness: 5,
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 1),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Members signed up for Competition', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                Text(membersSigned.toString(), style: TextStyle(fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),),

              ],
            ),
            padding: EdgeInsets.only(left: 30, right: 30,top: 30),
          ),


          Container(
            child: Divider(
              thickness: 5,
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          ),





          //adjust left right padding to increase or decrease width of button
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            height: 55.0,
            child: RaisedButton(
              onPressed: () {

                if( x ==0 ){

                  Firestore.instance.collection('meeting').document('membersInfo')
                      .get().then((DocumentSnapshot) {

                    int random = DocumentSnapshot.data['membersPresent'];
                    Firestore.instance.collection('meeting').document('membersInfo').updateData({ 'membersPresent' : random+1});
                    setState(() {
                      x++;
                      membersAbsent - 1;
                    });

                  }
                  );


                }

              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(

                  //TODO: Add gradient colors here
                    gradient: LinearGradient(colors: [Color.fromRGBO(29, 50, 81, 1), Color.fromRGBO(252, 66, 30, 1)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child: Container(

                  alignment: Alignment.center,
                  child: Text(
                    "Check into Meeting",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          ),




        ],




      ),
    );
  }




}