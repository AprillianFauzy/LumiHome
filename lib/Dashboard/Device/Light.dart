import 'package:flutter/material.dart';

class Lights extends StatefulWidget {
  const Lights({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  State<Lights> createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 270.0,
            maxWidth: 350.0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xFF619EF5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/lamp.png',
                height: 60,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lights",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
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
                          fontWeight: FontWeight.w600,
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
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "On",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
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
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "On",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
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
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "On",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
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
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "On",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
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
    );
  }
}
