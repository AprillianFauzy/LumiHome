import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({
    super.key,
    required this.onPressed,
    required this.image,
    required this.room,
    required this.conditon,
    this.child,
  });
  final VoidCallback onPressed;
  final String image;
  final String room;
  final String conditon;
  final Widget? child;
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13.0),
        child: Container(
          width: 120,
          color: Color(0xFF619EF5),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(children: [
            Image.asset(
              widget.image,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.room,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.conditon,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            widget.child ?? Container(),
          ]),
        ),
      ),
    );
  }
}
