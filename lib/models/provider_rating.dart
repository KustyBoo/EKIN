import 'package:flutter/material.dart';

class Rating {
  String url;

  Rating({required this.url});
}

class ProviderRating extends ChangeNotifier {
  int counter = 0;

  String urlBintang = "assets/bintang_outline.png";

  List<Rating> dataBintang = [
    Rating(url: "assets/bintang_outline.png"),
    Rating(url: "assets/bintang_outline.png"),
    Rating(url: "assets/bintang_outline.png"),
    Rating(url: "assets/bintang_outline.png"),
    Rating(url: "assets/bintang_outline.png"),
  ];

  int get counterCount{
    return counter;
  }

  void updateRating(int index) {
    if (index >= 0 && index < dataBintang.length) {
      for (int i = 0; i < dataBintang.length; i++) {
        if (i <= index) {
          dataBintang[i].url = "assets/bintang.png";
        } else {
          dataBintang[i].url = "assets/bintang_outline.png";
        }
      }
      counter = index + 1;
      print(counter);
    }
    notifyListeners();
  }
}
