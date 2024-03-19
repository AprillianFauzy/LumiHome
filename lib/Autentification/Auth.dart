import 'package:flutter/material.dart';
import 'package:lumihome/Autentification/SignUp.dart';
import 'package:lumihome/Autentification/login.dart';
import 'package:lumihome/Components/Button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    // container
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xffffffff),
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Gambar logo
                    Image.asset(
                      "images/logo.png",
                      width: 280,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Caption
                    const Text(
                      "Illuminate Your Life with Smart Living !",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                          color: Color(0xff619EF5),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    // Kumpulan Button
                    Column(
                      children: [
                        // Button Sign Up
                        MyButton(
                          text: "Sign Up",
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Color(0xff619EF5),
                              context: context,
                              isScrollControlled:
                                  true, // Ensure scrolling if needed
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  // Allow scrolling when keyboard appears
                                  child: Padding(
                                    // Add padding for bottom safety
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                      children: [SignUpPage()],
                                    ),
                                  ),
                                );
                              },
                              // Disable resize to avoid unwanted content adjustments
                            );
                          },
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 255,
                          child: const Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xff474747),
                                  thickness: 2.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xff474747),
                                  thickness: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Button Sign In
                        MyButton(
                          text: "Sign In",
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Color(0xff619EF5),
                              context: context,
                              isScrollControlled:
                                  true, // Ensure scrolling if needed
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  // Allow scrolling when keyboard appears
                                  child: Padding(
                                    // Add padding for bottom safety
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                      children: [LoginPage()],
                                    ),
                                  ),
                                );
                              },
                              // Disable resize to avoid unwanted content adjustments
                            );
                          },
                          type: ButtonType.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'images/logo.png',
                      height: 45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
