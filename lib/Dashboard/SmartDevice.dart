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
      heading: 'Smart Device',
      title: 'Dashboard',
      child: Column(
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
    );
  }
}
