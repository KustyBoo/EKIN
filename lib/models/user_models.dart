import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  String fullName = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";


  User({
    required this.fullName,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['Fullname'] ?? '',
      username: map['Username'] ?? '',
      email: map['Email'] ?? '',
      password: '',
      confirmPassword: '',
    );
  }
}
