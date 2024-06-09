import 'package:flutter/material.dart';
import 'package:lumihome/Components/Button.dart';
import 'package:lumihome/Components/TextField.dart';
import 'package:lumihome/DatabaseService.dart';
import 'package:lumihome/Model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Create Account",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: _fullNameController,
                label: "Full Name",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone Number",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: _phoneNumberController,
                label: "Phone Number",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: _emailController,
                label: "Email Address",
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              MyPassword(
                controller: _passwordController,
                label: "Password",
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          MyButton(
            text: "Sign Up",
            onTap: () {
              final email = _emailController.text.trim();
              final password = _passwordController.text.trim();
              final userdata = RegisterUser(
                fullName: _fullNameController.text.trim(),
                phoneNumber: _phoneNumberController.text.trim(),
              );

              DatabaseService().register(context, userdata, email, password);
            },
            type: ButtonType.primary,
            bgColor: Colors.white,
            textColor: Color(0xff619EF5),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
