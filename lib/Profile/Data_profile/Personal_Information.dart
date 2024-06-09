import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lumihome/Profile/Component/mytextfield.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool isEditing = false;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();
  User? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      _isLoading = true;
    });

    user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users').child(user!.uid);
        final snapshot = await userRef.get();

        if (snapshot.exists) {
          final userData = Map<String, dynamic>.from(snapshot.value as Map);
          setState(() {
            nameController.text = userData['name'] ?? '';
            addressController.text = userData['address'] ?? '';
            birthController.text = userData['birth'] ?? '';
            phoneController.text = userData['phone'] ?? '';
            _isLoading = false;
          });
        } else {
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
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to update user data
  Future<void> _updateUserData() async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(user!.uid);

    try {
      await userRef.update({
        'name': nameController.text,
        'address': addressController.text,
        'birth': birthController.text,
        'phone': phoneController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User data updated successfully'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      print("Error updating user data: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update user data. Please try again.'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    MyTextField(
                      labelText: 'Your Name',
                      text: "Full Name",
                      controller: nameController,
                      value: nameController.text,
                      readonly: !isEditing,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      labelText: 'Address',
                      text: "Address",
                      controller: addressController,
                      value: addressController.text,
                      readonly: !isEditing,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      labelText: 'Birth',
                      text: "Birth",
                      controller: birthController,
                      value: birthController.text,
                      readonly: !isEditing,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      labelText: 'Handphone',
                      text: "Handphone",
                      controller: phoneController,
                      value: phoneController.text,
                      readonly: !isEditing,
                    ),
                    SizedBox(
                      height: 15,
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
                                    _updateUserData(); // Call function to update user data
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
