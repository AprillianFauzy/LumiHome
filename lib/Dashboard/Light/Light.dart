import 'package:flutter/material.dart';
import 'package:lumihome/Components/Button.dart';

class LightPage extends StatefulWidget {
  const LightPage({super.key});

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: MyButton(
            text: "Light",
            onTap: () {
              Navigator.pushNamed(context, '/room');
            }),
      )),
    );
  }
}
