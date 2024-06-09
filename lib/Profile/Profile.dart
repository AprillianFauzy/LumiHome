import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Components/CardMenuProfile.dart';
import 'package:lumihome/DatabaseService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  Map<String, dynamic>? userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    setState(() {
      _isLoading = true;
    });

    // Mendapatkan pengguna yang sudah login
    user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Ambil data tambahan dari Firebase Realtime Database
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users').child(user!.uid);

        final snapshot = await userRef.get();

        if (snapshot.exists) {
          setState(() {
            userData = Map<String, dynamic>.from(snapshot.value as Map);
            _isLoading = false;
          });
        } else {
          print("Snapshot does not exist");
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print("Error getting user data: $e");
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      print("User is not logged in");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
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
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/10/200/300'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${userData?['name'] ?? 'User'}'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
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
                            Navigator.pushNamed(
                                context, '/PersonalInformation');
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
                              DatabaseService.logoutUser(context);
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
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
