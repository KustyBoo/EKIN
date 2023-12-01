
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
}
