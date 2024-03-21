import 'package:flutter/material.dart';
import 'package:lumihome/Components/CardMenuProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'images/Back.png',
                      width: 24,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  Spacer(),
                  Container(
                    width: 45,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.red,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/10/200/300'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Satria Dharma",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  CardMenuProfile(
                    onTap: () {
                      Navigator.pushNamed(context, '/PersonalInformation');
                    },
                    text: 'Personal Information',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CardMenuProfile(
                    onTap: () {
                      Navigator.pushNamed(context, '/Account');
                    },
                    text: 'Account',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CardMenuProfile(
                    onTap: () {
                      Navigator.pushNamed(context, '/ChangePassword');
                    },
                    text: 'Change Password',
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Auth');
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD92519),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 12.0),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
