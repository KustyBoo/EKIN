import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reviews {
  String username;
  String reviews;
  int rating;

  Reviews({
    required this.username,
    required this.reviews,
    required this.rating,
  });

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      username: map['Username'] ?? '',
      reviews: map['Review'] ?? '',
      rating: map['Rating'] ?? '',
    );
  }
}