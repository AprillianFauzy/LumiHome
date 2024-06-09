import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Autentification/Auth.dart';
import 'package:lumihome/Dashboard/Rooms.dart';
import 'package:lumihome/Dashboard/SmartDevice.dart';
import 'package:lumihome/Door/Door_Details.dart';
import 'package:lumihome/Profile/Data_profile/Account.dart';
import 'package:lumihome/Profile/Data_profile/Change_Password.dart';
import 'package:lumihome/Profile/Data_profile/Personal_Information.dart';
import 'package:lumihome/Profile/Profile.dart';
import 'package:lumihome/Splash/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/DoorDetails': (context) => DoorDetails(),
      },
    );
  }
}
