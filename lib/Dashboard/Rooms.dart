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
      title: "Dashboard",
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
                "Rooms",
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
                children: [
                  RoomPage(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Lights');
                    },
                    image: "images/tv.png",
                    room: 'Living Room',
                    conditon: 'On',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
