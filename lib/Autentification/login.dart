import 'package:flutter/material.dart';
import 'package:lumihome/Components/Button.dart';
import 'package:lumihome/Components/TextField.dart';
import 'package:lumihome/DatabaseService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            "Sign In",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
                color: Color(0xffffffff),
                fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 20.0,
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
              MyTextField(controller: emailController, label: "Email Address"),
            ],
          ),
          SizedBox(
            height: 15.0,
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
              MyPassword(controller: passwordController, label: "Password"),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          MyButton(
            text: "Sign In",
            onTap: () async {
              // Attempt to login using the provided credentials
              final result = await DatabaseService.loginUser(
                  emailController.text, passwordController.text);

              // Check if login was successful
              if (result) {
                // Navigate to the dashboard page
                Navigator.pushNamed(context, '/Dashboard');
              } else {
                // Display an error message indicating failed login
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Login failed. Please check your credentials.'),
                  backgroundColor: Colors.red,
                ));
              }
            },
            type: ButtonType.primary,
            bgColor: Colors.white,
            textColor: Color(0xff619EF5),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Or",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MyButton(
            text: "Continue With Google",
            onTap: () {},
            type: ButtonType.icon,
            image: 'images/google.png',
            height: 50,
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
