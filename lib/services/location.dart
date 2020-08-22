import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderizr/constants.dart';
import 'package:orderizr/custom_widgets/iconplusname.dart';
import 'file:///D:/Work/Flutter_Projects/orderizr/lib/pages/home_pages/user_home.dart';

//import 'package:geolocator/geolocator.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'package:android_intent/android_intent.dart';
// TODO: Ask for location permission and keep it in firebase..

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
          child: Center(
            child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 20.0, color: kMainColor),
                    borderRadius: BorderRadius.circular(150)),
                child: ListView(
                  children: <Widget>[
                    CustomIconAndName(kMainColor, 'assets/images/alarm.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 60),
                      child: Image.asset(
                        'assets/images/gps.jpg',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'ابحث عن أفضل المتاجر القريبه منك',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontFamily: 'Changa',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Text(
                        'Gps لنبدأ بالسماح للوصول إلى ال',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14.0,
                          fontFamily: 'Changa',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 10.0),
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          color: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(false),
                                ),
                              ),
                          // will be change,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              Text(
                                'السماح للوصول لموقعك',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: 'Changa',
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                )),
          ),
        ));
  }
}
//Center(
//child: FlatButton(
//color: kMainColor,
//child: Text('Go to Home',style: TextStyle(color: Colors.white),),
//onPressed: () => Navigator.pushReplacement(
//context,
//MaterialPageRoute(
//builder: (context) => HomePage()), // will be changed..
//),
//),
//),
