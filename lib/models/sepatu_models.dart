import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sepatu {
  String url;
  String nama;
  String brand;
  String harga;
  String description;
  String color;
  String year;
  int rating;

  Sepatu({
    required this.url,
    required this.nama,
    required this.brand,
    required this.description,
    required this.rating,
    required this.harga,
    required this.color,
    required this.year,
  });

  factory Sepatu.fromMap(Map<String, dynamic> map) {
    return Sepatu(
      url: map['Location'] ?? '',
      nama: map['Nama'] ?? '',
      brand: map['Brand'] ?? '',
      harga: map['Harga'] ?? '',
      color: map['Color'] ?? '',
      year: map['year'] ?? '',
      rating: map['Rating'] ?? 0,
      description: map['description'] ?? '',
    );
  }
}
