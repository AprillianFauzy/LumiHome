import 'package:flutter/material.dart';
import 'package:lumihome/Autentification/Auth.dart';
import 'package:lumihome/Dashboard/Rooms.dart';
import 'package:lumihome/Dashboard/SmartDevice.dart';
import 'package:lumihome/Profile/Data_profile/Account.dart';
import 'package:lumihome/Profile/Data_profile/Change_Password.dart';
import 'package:lumihome/Profile/Data_profile/Personal_Information.dart';
import 'package:lumihome/Profile/Profile.dart';
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
        '/Dashboard': (context) => SmartDevice(),
        '/Rooms': (context) => RoomsPage(),
        '/Profile': (context) => ProfilePage(),
        '/PersonalInformation': (context) => PersonalInformation(),
        '/Account': (context) => Account(),
        '/ChangePassword': (context) => ChangePassword(),
      },
    );
  }
}
