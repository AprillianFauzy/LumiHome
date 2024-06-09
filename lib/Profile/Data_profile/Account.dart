import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final snapshot = await databaseReference.child('users/$uid').get();
        if (snapshot.exists) {
          final data = snapshot.value as Map;
          emailController.text = data['email'] ?? '';
          user = FirebaseAuth.instance.currentUser;
        }
      }
    } catch (error) {
      print('Failed to load user data: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> sendVerificationEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification Email Send')),
      );
    }
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Email Not Verified"),
          content: Text("Please verify your email to proceed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF619EF5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      onPressed: () async {
                        if (user != null && !user!.emailVerified) {
                          sendVerificationEmail();
                        } else if (user != null && user!.emailVerified) {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        } else {
                          showAlertDialog();
                        }
                      },
                      child: Text(
                        "Send Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
