import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/const.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Image.asset(
                      'assets/images/signin/in.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 130,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 52.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12.0,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 15.0,
                                  color: Color(0xFF404040),
                                ),
                              ),
                            ),
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/signin/2450.jpg'),
                          ),
                        )),
                  ),
                ]),
              ),
              Column(
                children: [
                  Text(
                    'Mahad Shbeeb',
                    style: TextStyle(
                        color: Color(0xFF2c2b2b),
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'mhdshbeeb@gmail.com',
                    style: TextStyle(
                        color: Color(0xFF2c2b2b),
                        fontFamily: 'Montserrat',
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  height: 1,
                  width: 200,
                  color: Colors.black12,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.shoppingCart,
                          color: Color(0xFF2c2b2b),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Orders',
                          style: TextStyle(
                              color: Color(0xFF2c2b2b),
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(height: 50, color: Colors.black12),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color(0xFF2c2b2b),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Color(0xFF2c2b2b),
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
