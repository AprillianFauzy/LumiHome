import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    required this.title,
    required this.heading,
    this.child,
  });

  final String title;
  final String heading;
  final Widget? child;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
        backgroundColor: const Color(0xffF2F5FE),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    radius: 27.0,
                                    backgroundColor: Colors.red,
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/id/10/200/300'),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Profile');
                                    },
                                    icon: Image.asset(
                                      'images/setting.png',
                                      width: 32.0,
                                      height: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hi, ${userData?['name'] ?? 'User'}"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Text(
                                      "Welcome To Your Smarthome",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 28,
                                        right: 28,
                                      ),
                                      child: Text(
                                        widget.heading,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28),
                                      child: widget.child,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Dashboard');
                        },
                        child: Image.asset(
                          'images/logo.png',
                          height: 45,
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
