// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class Filter {
  String nama;
  Color bgColor;

  Filter({
    required this.nama,
    required this.bgColor,
  });
}

class AscendDesend {
  String nama;
  Color bgColor;
  Color foreColor;
  Radius topleft;
  Radius topRight;
  Radius bottomLeft;
  Radius bottomRight;
  IconData iconArrow;

  AscendDesend({
    required this.nama,
    required this.bgColor,
    required this.foreColor,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topRight,
    required this.topleft,
    required this.iconArrow,
  });
}

class ProviderFilter extends ChangeNotifier {
  int counterClicked = 0;

  final List<Filter> filterData = [
    Filter(
      nama: "Price",
      bgColor: Colors.transparent,
    ),
    Filter(
      nama: "Brand",
      bgColor: Colors.transparent,
    ),
    Filter(
      nama: "Color",
      bgColor: Colors.transparent,
    ),
    Filter(
      nama: "Year",
      bgColor: Colors.transparent,
    ),
  ];

  final List<int> filterClicked = [];

  int get btnCount {
    return filterData.length;
  }

  void updateBtn(int index) {
    if (filterClicked.contains(index) == false) {
      for (int i = 0; i < filterData.length; i++) {
        if (filterData[i].bgColor == colorMode.primary) {
          filterData[i].bgColor = Colors.transparent;
          filterClicked.removeLast();
        }
      }
      filterData[index].bgColor = colorMode.primary;
      filterClicked.add(index);
    } else if (filterClicked.contains(index) == true) {
      filterData[index].bgColor = Colors.transparent;
      filterClicked.remove(index);
    }
    notifyListeners();
  }
}

class ProviderAscDesc extends ChangeNotifier {
  final List<AscendDesend> ascDesc = [
    AscendDesend(
      nama: "Ascending",
      bgColor: Colors.transparent,
      foreColor: colorMode.primary,
      topleft: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      topRight: Radius.circular(0),
      bottomRight: Radius.circular(0),
      iconArrow: Icons.expand_less,
    ),
    AscendDesend(
      nama: "Descending",
      bgColor: Colors.transparent,
      foreColor: colorMode.primary,
      topleft: Radius.circular(0),
      bottomLeft: Radius.circular(0),
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
       iconArrow: Icons.expand_more,
    ),
  ];

  final List<int> acsDescClicked = [];

  int get btnCount {
    return ascDesc.length;
  }

  void updateBtn(int index) {
    if (acsDescClicked.contains(index) == false) {
      for (int i = 0; i < ascDesc.length; i++) {
        if (ascDesc[i].bgColor == colorMode.primary) {
          ascDesc[i].bgColor = Colors.transparent;
          ascDesc[i].foreColor = colorMode.primary;
          acsDescClicked.removeLast();
        }
      }
      ascDesc[index].bgColor = colorMode.primary;
      ascDesc[index].foreColor = Colors.white;
      acsDescClicked.add(index);
    } else if (acsDescClicked.contains(index) == true) {
      ascDesc[index].bgColor = Colors.transparent;
      ascDesc[index].foreColor = colorMode.primary;
      acsDescClicked.remove(index);
    }
    notifyListeners();
  }
}
