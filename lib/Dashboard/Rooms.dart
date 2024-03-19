import 'package:flutter/material.dart';
import 'package:lumihome/Components/Button.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: MyButton(
            text: "Rooms",
            onTap: () {
              Navigator.pushNamed(context, '/Lights');
            }),
      )),
    );
  }
}
