// auth.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_models.dart' as models;

class AuthServices extends ChangeNotifier{
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<models.User> signUp(String fullName, String username, String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      throw Exception("Passwords do not match");
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebase_auth.User? user = _auth.currentUser;

      await _firestore.collection('users').doc(user!.uid).set({
        'fullName': fullName,
        'username': username,
        'email': email,
      });

      return models.User(
        fullName: fullName,
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        
      );
    } catch (e) {
      print('Registration failed: $e');
      throw e;
    }
  }

  Future<models.User> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebase_auth.User? user = _auth.currentUser;

      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

      return models.User(
          fullName: userDoc.get('fullName'),
          username: '', 
          email: userDoc.get('email'),
          password: '',
          confirmPassword: '',
      );
    } catch (e) {
      print('Login failed: $e');

      String errorMessage = "Failed to login. Please check your credentials.";

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        }
      }

      throw errorMessage;
    }
  }

}