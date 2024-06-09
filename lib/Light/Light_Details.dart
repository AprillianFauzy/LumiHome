import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LightDetails extends StatefulWidget {
  const LightDetails({
    super.key,
    required this.room,
    required this.led,
  });

  final String room;
  final String led;

  @override
  State<LightDetails> createState() => _LightDetailsState();
}

class _LightDetailsState extends State<LightDetails> {
  late final DatabaseReference _dbRef;
  bool isPressed = false;
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    _dbRef = FirebaseDatabase.instance.ref().child('ESP32/led${widget.led}');
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value as int?;
      if (data != null) {
        setState(() {
          isOn = data == 1;
        });
      }
    });
  }

  void _onButtonTap() {
    setState(() {
      isPressed = true;
    });

    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        isPressed = false;
        isOn = !isOn;
      });
      _dbRef.set(isOn ? 1 : 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
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
                      'images/backW.png',
                      width: 24,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Light',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 45,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.room,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Detail',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: isOn
                          ? Image.asset(
                              'images/LampON.png',
                              key: ValueKey('LampON'),
                              width: 284,
                            )
                          : Image.asset(
                              'images/LampOFF.png',
                              key: ValueKey('LampOFF'),
                              width: 284,
                            ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    GestureDetector(
                      onTap: _onButtonTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        width: 155,
                        height: 55,
                        child: Center(
                          child: OverflowBox(
                            maxWidth: double.infinity,
                            maxHeight: double.infinity,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              width: 155,
                              height: 55,
                              margin: isPressed
                                  ? EdgeInsets.all(0)
                                  : EdgeInsets.only(bottom: 18, left: 12),
                              child: Center(
                                child: Text(
                                  isOn ? 'ON' : 'OFF',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
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
