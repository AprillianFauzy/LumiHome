import 'package:flutter/material.dart';

class Lights extends StatefulWidget {
  const Lights({super.key});

  @override
  State<Lights> createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Rooms');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 28,
          right: 28,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Color(0xFF619EF5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/lamp.png",
                    height: 60,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lights",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Status Devices",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Text(
                                    "Living Room",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "On",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Text(
                                    "Bedroom",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "On",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Text(
                                    "Kitchen",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "On",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                children: [
                                  Text(
                                    "Bathroom",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "On",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Switch.adaptive(
                          value:
                              _isOn, // Boolean value representing the current state (on or off)
                          onChanged: (newValue) {
                            setState(() {
                              _isOn = newValue;
                            });
                          },
                          activeTrackColor: Colors.white30,

                          activeColor: Colors.white,
                          inactiveTrackColor: Colors.white30,
                          inactiveThumbColor: Colors.white,
                        ),
                        Text(
                          "On",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
