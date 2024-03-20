import 'package:flutter/material.dart';
import 'package:lumihome/Dashboard/Dashboard.dart';
import 'package:lumihome/Dashboard/Device/Door.dart';
import 'package:lumihome/Dashboard/Device/Light.dart';

class SmartDevice extends StatefulWidget {
  const SmartDevice({super.key});

  @override
  State<SmartDevice> createState() => _SmartDeviceState();
}

class _SmartDeviceState extends State<SmartDevice> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage(
      title: 'Dashboard',
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
                Lights(
                  onTap: () {
                    Navigator.pushNamed(context, "/Rooms");
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Door(
                  onTap: () {
                    Navigator.pushNamed(context, "/Lights");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
