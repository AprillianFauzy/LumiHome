import 'package:flutter/material.dart';
import 'package:lumihome/Autentification/Auth.dart';
import 'package:lumihome/Dashboard/Dashboard.dart';
import 'package:lumihome/Dashboard/Light/Light.dart';
import 'package:lumihome/Dashboard/Rooms.dart';
import 'package:lumihome/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Auth': (context) => AuthPage(),
        '/Dashboard': (context) => DashboardPage(
              title: 'Dashboard',
            ),
        '/Rooms': (context) => RoomsPage(),
        '/Lights': (context) => LightPage(),
      },
    );
  }
}
