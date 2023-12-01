import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reviews {
  String username;
  String reviews;

  Reviews({
    required this.username,
    required this.reviews,
  });

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      username: map['Username'] ?? '',
      reviews: map['Review'] ?? '',
    );
  }
}
