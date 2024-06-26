import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DoorDetails extends StatefulWidget {
  const DoorDetails({super.key});

  @override
  State<DoorDetails> createState() => _DoorDetailsState();
}

class _DoorDetailsState extends State<DoorDetails> {
  bool _isOpen = false;
  bool _isLoading = false;
  double _rotationAngle = 0.0;
  final DatabaseReference _doorStatusRef =
      FirebaseDatabase.instance.ref('/ESP32');

  @override
  void initState() {
    super.initState();
    _fetchDoorStatus();
  }

  void _fetchDoorStatus() {
    _doorStatusRef.onValue.listen((event) {
      final data = event.snapshot.value as Map;
      setState(() {
        _isOpen = data['open'] ?? false;
      });
    });
  }

  Future<void> _updateDoorStatus(bool isOpen) async {
    setState(() {
      _isLoading = true;
      _startRotation();
    });

    try {
      await _doorStatusRef.update({
        'open': !isOpen,
        'lock': isOpen,
      });
      // Ensure that local state is updated after the Firebase update
      setState(() {
        _isOpen = !isOpen;
      });
    } catch (error) {
      print("Error updating door status: $error");
      // Handle update error (e.g., show a snackbar)
    } finally {
      setState(() {
        _isLoading = false;
        _rotationAngle = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                height: 600,
                color: const Color(0xFF619EF5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            'images/backW.png',
                            width: 24,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Main Door',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        const Spacer(),
                        Container(
                          width: 45,
                        )
                      ],
                    ),
                    const SizedBox(
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
                                height: 405,
                                child: Image.asset('images/Loader.png',
                                    width: 200),
                              ),
                            )
                          : _isOpen
                              ? Container(
                                  width: 300,
                                  child: Image.asset(
                                    'images/DoorOpen.png',
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(
                                  width: 205,
                                  child: Image.asset(
                                    'images/DoorClose.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                    ),
                    Text(
                      _isLoading
                          ? 'Loading...'
                          : _isOpen
                              ? 'Unlocked'
                              : 'Locked',
                      style: const TextStyle(
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
                        _updateDoorStatus(_isOpen);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
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
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
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
          ],
        ),
      ),
    );
  }

  void _startRotation() {
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _rotationAngle += 0.02;
        if (_rotationAngle >= 2 * pi) {
          _rotationAngle = 0.0;
        }
      });
    });
  }
}
