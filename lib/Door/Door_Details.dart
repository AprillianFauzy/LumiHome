import 'dart:async'; // Import for Timer
import 'dart:math';

import 'package:flutter/material.dart';

class DoorDetails extends StatefulWidget {
  const DoorDetails({super.key});

  @override
  State<DoorDetails> createState() => _DoorDetailsState();
}

class _DoorDetailsState extends State<DoorDetails> {
  bool _isOpen = false;
  bool _isLoading = false;
  double _rotationAngle = 0.0; // Variable for rotation angle

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                height: 600,
                color: Color(0xFF619EF5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            'images/Back.png',
                            width: 24,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Main Door',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        Spacer(),
                        Container(
                          width: 45,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: _isLoading
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..rotateZ(_rotationAngle),
                              child: Container(
                                height: 405, // Set desired height here
                                child: Image.asset('images/Loader.png',
                                    width: 200),
                              ),
                            )
                          : _isOpen
                              ? Container(
                                  width: 200, // Set desired width
                                  child: Image.asset(
                                    'images/DoorClose.png',
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(
                                  width: 300, // Set desired width
                                  child: Image.asset(
                                    'images/DoorOpen.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                    ),
                    Text(
                      _isLoading
                          ? 'Loading...'
                          : _isOpen
                              ? 'Unlock'
                              : 'Locked',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 100.0 / 48.0,
                    child: Switch(
                      value: _isOpen,
                      onChanged: (value) {
                        setState(() {
                          _isLoading = true;
                          _startRotation();
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              _isOpen = value;
                              _isLoading = false;
                              _rotationAngle = 0.0;
                            });
                          });
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Swipe to unlock",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF619EF5),
                    ),
                  )
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

  void _startRotation() {
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _rotationAngle += 0.02; // Adjust for desired rotation speed
        if (_rotationAngle >= 2 * pi) {
          // Check for full rotation
          _rotationAngle = 0.0; // Reset after one full rotation
        }
      });
    });
  }
}
