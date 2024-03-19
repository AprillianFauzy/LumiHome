import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffF2F5FE),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 27.0,
                              backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/10/200/300'),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Rooms');
                              },
                              icon: Image.asset(
                                'images/setting.png',
                                width: 32.0,
                                height: 32.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hi, Satria Dharma",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Welcome To Your Smarthome",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 28,
                                  right: 28,
                                ),
                                child: Text(
                                  "Smart Device",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 28),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/Rooms");
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            minWidth: 270.0,
                                            maxWidth: 350.0,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          color: Color(0xFF619EF5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'images/lamp.png',
                                                height: 60,
                                              ),
                                              Spacer(),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Lights",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Status Devices",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      child: Row(children: [
                                                        Text(
                                                          "Living Room",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "On",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ]),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      child: Row(children: [
                                                        Text(
                                                          "Bedroom",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "On",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ]),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      child: Row(children: [
                                                        Text(
                                                          "Kitchen",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "On",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ]),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      child: Row(children: [
                                                        Text(
                                                          "Bathroom",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "On",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ]),
                                                    ),
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
                                                      activeTrackColor:
                                                          Colors.white30,

                                                      activeColor: Colors.white,
                                                      inactiveTrackColor:
                                                          Colors.white30,
                                                      inactiveThumbColor:
                                                          Colors.white,
                                                    ),
                                                    Text(
                                                      "On",
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w900,
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
                                    SizedBox(
                                      height: 25,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/Lights");
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          height: 86,
                                          constraints: const BoxConstraints(
                                            minWidth: 270.0,
                                            maxWidth: 350.0,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          color: Color(0xFF619EF5),
                                          child: Row(children: [
                                            Image.asset(
                                              'images/Door.png',
                                              height: 60,
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Door",
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Unlock",
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              width: 140,
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                // Your Positioned widget here
                bottom: 0.0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Dashboard');
                    },
                    child: Image.asset(
                      'images/logo.png',
                      height: 45,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
