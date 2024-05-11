import 'package:flutter/material.dart';
import 'package:lumihome/Profile/Component/mytextfield.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

final nameController = TextEditingController(); // Initial value for name
final addressController = TextEditingController(); // Initial value for address
final birthController = TextEditingController(); // Initial value for birth
final phoneController = TextEditingController(); // Initial value for phone

class _PersonalInformationState extends State<PersonalInformation> {
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
                    'Personal Information',
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
                  labelText: 'Your Name',
                  text: "Full Name",
                  controller: nameController,
                  value: "Aprillian Pauzy",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Your Name',
                  text: "Address",
                  controller: addressController,
                  value: "Batam",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Your Name',
                  text: "Birth",
                  controller: birthController,
                  value: "19-09-2009",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Your Name',
                  text: "Handphone",
                  controller: phoneController,
                  value: "08947874618",
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
