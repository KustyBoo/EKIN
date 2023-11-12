// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProviderIconNav extends ChangeNotifier {
  Icon iconFAB = Icon(
    Icons.local_mall_outlined,
    size: 24,
    color: Colors.black,
  );

  // mengambil icon sekarang
  Icon get currentIcon {
    return iconFAB;
  }

  // melakukan refresh menggunanakn notify listener
  void refreshIcon() {
    iconFAB = Icon(
      Icons.local_mall,
      size: 24,
      color: Colors.black,
    );
    notifyListeners();
  }

  // melakukan reset menggunanakn notify listener
  void resetIcon() {
    iconFAB = Icon(
      Icons.local_mall_outlined,
      size: 24,
      color: Colors.black,
    );
    notifyListeners();
  }
}
