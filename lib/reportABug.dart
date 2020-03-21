import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

import 'intro.dart';


class reportABugState extends StatefulWidget{

  @override
  reportABug createState() => reportABug();


}



class reportABug extends State<reportABugState>{

  TextEditingController nameController = new TextEditingController();
  TextEditingController info = new TextEditingController();




  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {







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
                    child: Text('Report a Bug Form', style: TextStyle(fontSize: 20, color: Colors.white),),
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
                      child: Text('Report the Bug:',style: TextStyle(fontSize: 17),),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: TextField(
                        controller: info,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
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
                            hintText: "Information about Bug",
                            fillColor: Colors.white70),
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
                              Firestore.instance.collection('reportABug').document(nameController.text).setData({'description' : info.text});

                              Fluttertoast.showToast(
                                  msg: "Thank you for the feedback",
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






}