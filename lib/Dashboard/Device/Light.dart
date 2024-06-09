import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Lights extends StatefulWidget {
  const Lights({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  State<Lights> createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  Map<String, bool> _lightsStatus = {
    'Living Room': false,
    'Bedroom': false,
    'Kitchen': false,
    'Bathroom': false,
  };

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    final DatabaseEvent event = await _dbRef.child('/ESP32').once();
    if (event.snapshot.value != null) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _lightsStatus = {
          'Living Room': data['led1'] == 1,
          'Bedroom': data['led2'] == 1,
          'Kitchen': data['led3'] == 1,
          'Bathroom': data['led4'] == 1,
        };
      });
    }
  }

  Future<void> _updateSwitchState(bool newValue) async {
    await _dbRef.child('/ESP32').update({
      'led1': newValue ? 1 : 0,
      'led2': newValue ? 1 : 0,
      'led3': newValue ? 1 : 0,
      'led4': newValue ? 1 : 0,
    });
    _loadSwitchState();
  }

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
                        color: Colors.white,
                      ),
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _buildStatusRow("Living Room"),
                    SizedBox(
                      height: 3,
                    ),
                    _buildStatusRow("Bedroom"),
                    SizedBox(
                      height: 3,
                    ),
                    _buildStatusRow("Kitchen"),
                    SizedBox(
                      height: 3,
                    ),
                    _buildStatusRow("Bathroom"),
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
                      value: _lightsStatus.values.every((status) => status),
                      onChanged: (newValue) {
                        setState(() {
                          _lightsStatus.updateAll((key, value) => newValue);
                        });
                        _updateSwitchState(newValue);
                      },
                      activeTrackColor: Colors.white30,
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.white30,
                      inactiveThumbColor: Colors.white,
                    ),
                    Text(
                      _lightsStatus.values.every((status) => status)
                          ? "On"
                          : "Off",
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

  Widget _buildStatusRow(String room) {
    return Container(
      width: 110,
      child: Row(
        children: [
          Text(
            room,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            _lightsStatus[room]! ? "On" : "Off",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
