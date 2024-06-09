import 'package:flutter/material.dart';

class Door extends StatefulWidget {
  const Door({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<Door> createState() => _DoorState();
}

class _DoorState extends State<Door> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: 86,
          constraints: const BoxConstraints(
            minWidth: 270.0,
            maxWidth: 350.0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFF619EF5),
            image: DecorationImage(
              image: AssetImage('images/map.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(children: [
            Image.asset(
              'images/Door.png',
              height: 60,
            ),
            Spacer(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Door",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Unlock",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: 140,
            )
          ]),
        ),
      ),
    );
  }
}
