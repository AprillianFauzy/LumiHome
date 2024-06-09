class RegisterUser {
  String fullName;
  String phoneNumber;

  RegisterUser({
    required this.fullName,
    required this.phoneNumber,
  });

  // Convert a UserModel into a Map. The keys must correspond to the names of the
  // database fields in the Realtime Database.
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  // Convert a Map into a UserModel.
  RegisterUser.fromMap(Map<String, dynamic> map)
      : fullName = map['fullName'],
        phoneNumber = map['phoneNumber'];
}
