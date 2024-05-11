import 'package:flutter/material.dart';
import 'package:lumihome/Profile/Component/mytextfield.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

final phoneController = TextEditingController(); // Initial value for phone

class _AccountState extends State<Account> {
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
                    'Account',
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
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Your Email',
                  text: "Email",
                  controller: phoneController,
                  value: "aprillianpauzy@gmail.com",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF619EF5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10), // Tambahkan padding di sini
                  ),
                  onPressed: () {
                    print('Update button pressed!');
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
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
