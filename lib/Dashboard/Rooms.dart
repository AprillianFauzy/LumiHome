import 'package:flutter/material.dart';
import 'package:lumihome/Dashboard/Dashboard.dart';
import 'package:lumihome/Dashboard/Rooms/Room.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({
    super.key,
  });

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage(
      heading: 'Rooms',
      title: "Dashboard",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoomPage(
                onPressed: () {
                  Navigator.pushNamed(context, '/Lights');
                },
                image: "images/tv.png",
                room: 'Living Room',
                conditon: 'On',
              ),
              SizedBox(
                width: 50,
              ),
              RoomPage(
                onPressed: () {
                  Navigator.pushNamed(context, '/Lights');
                },
                image: "images/bed.png",
                room: 'Bedroom',
                conditon: 'On',
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoomPage(
                onPressed: () {
                  Navigator.pushNamed(context, '/Lights');
                },
                image: "images/Kitchen.png",
                room: 'Kitchen',
                conditon: 'On',
              ),
              SizedBox(
                width: 50,
              ),
              RoomPage(
                onPressed: () {
                  Navigator.pushNamed(context, '/Lights');
                },
                image: "images/bath.png",
                room: 'Bathroom',
                conditon: 'On',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
