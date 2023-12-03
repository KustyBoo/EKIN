
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pa_ekin/models/reviews_models.dart';

class ProviderShoeReviews extends ChangeNotifier {
  final List<Reviews> _reviews = [];

  UnmodifiableListView<Reviews> get users => UnmodifiableListView(_reviews);

  int get userCount {
    return _reviews.length;
  }

  void addReview(Reviews newReview) {
    _reviews.add(newReview);
    notifyListeners();
  }

  void delReview(Reviews newReview) {
    _reviews.remove(newReview);
    notifyListeners();
  }


  //   List<Reviews>? _users;

  // List<Reviews>? get users => _users;

  //  int get userCount => _users?.length ?? 0;

  // void addReview(Reviews review) {
  //   _users?.add(review);
  //   notifyListeners();
  // }
}
