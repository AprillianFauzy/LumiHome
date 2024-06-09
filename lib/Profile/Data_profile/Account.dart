import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Profile/Component/mytextfield.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isEditing = false;
  final emailController = TextEditingController();
  User? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emailController.text = user!.email ?? '';
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateEmail() async {
    try {
      if (user != null && !user!.emailVerified) {
        await user!.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Please verify your current email before changing it. A verification email has been sent.'),
        ));
        return;
      }

      String newEmail = emailController.text;

      if (user!.email != newEmail) {
        // Re-authenticate the user to update the email
        await _reauthenticateUser();

        await user!.updateEmail(newEmail);
        await user!.sendEmailVerification();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Email updated successfully! Please verify your new email.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email address remains the same.'),
        ));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update email: ${e.message}'),
      ));
    }
  }

  Future<void> _reauthenticateUser() async {
    try {
      String password = await _showPasswordDialog();

      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: password,
      );
      await user!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Re-authentication failed: ${e.message}'),
      ));
    }
  }

  Future<String> _showPasswordDialog() async {
    String password = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Re-authenticate'),
        content: TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Enter your password'),
          onChanged: (value) {
            password = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(password);
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MyTextField(
                    readonly: !isEditing,
                    labelText: 'Your Email',
                    text: "Email",
                    controller: emailController,
                    value: emailController.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (user != null && !user!.emailVerified)
                    Text(
                      'Please verify your email to update it.',
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  Container(
                    alignment: Alignment.topRight,
                    child: isEditing
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEditing = false;
                                  });
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF619EF5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEditing = false;
                                  });
                                  _updateEmail();
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF619EF5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                            onPressed: () {
                              setState(() {
                                isEditing = true;
                              });
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
    );
  }
}
