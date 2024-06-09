import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Profile/Component/mytextfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

final currentPasswordController = TextEditingController();
final newPasswordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _changePassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New passwords do not match")),
      );
      return;
    }

    try {
      User? user = _auth.currentUser;
      String email = user?.email ?? '';

      // Re-authenticate the user
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: currentPasswordController.text,
      );

      await user?.reauthenticateWithCredential(credential);

      // Change the password
      await user?.updatePassword(newPasswordController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password changed successfully")),
      );

      // Clear the text fields
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to change password: $e")),
      );
    }
  }

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
                    'Change Password',
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
                    text: "Current Password",
                    labelText: 'Enter Your Current Password',
                    controller: currentPasswordController,
                    value: "",
                    fieldType: FieldType.password),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Enter New Password',
                  text: "New Password",
                  controller: newPasswordController,
                  value: "",
                  fieldType: FieldType.password,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: MyTextField(
                  labelText: 'Re-Password',
                  text: "Re-Password",
                  controller: confirmPasswordController,
                  value: "",
                  fieldType: FieldType.password,
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
                  onPressed: _changePassword,
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
