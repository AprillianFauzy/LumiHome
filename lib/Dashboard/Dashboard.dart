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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffF2F5FE),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "Hi, Satria Dharma",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
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
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 28,
                                  right: 28,
                                ),
                                child: Text(
                                  widget.heading,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 28),
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
              child: Positioned(
                // Your Positioned widget here
                bottom: 0.0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
