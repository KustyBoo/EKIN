import 'dart:collection';

import 'package:flutter/material.dart';

class Review {
  String nama;
  double rating;

  Review({
    required this.nama,
    required this.rating,
  });
}

class ProviderReview extends ChangeNotifier {
  final List<Review> reviewData = [];

  // membuat unmodifiedlistview untuk review
  UnmodifiableListView<Review> get sepatu {
    return UnmodifiableListView(reviewData);
  }

  // fungsi menghitung banyak review
  int get reviewCount {
    return reviewData.length;
  }
}
