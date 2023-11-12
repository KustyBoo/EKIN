import 'package:flutter/material.dart';

class ProviderIndexScreenData extends ChangeNotifier{

  // variabel index layar
  int screenIndex = 0;

  // mengambil index layar sekarang
  int get currentScreenIndex{
    return screenIndex;
  }

  // melakukan refresh menggunanakn notify listener
  void refreshScreen(int indexBaru){
    screenIndex = indexBaru;
    notifyListeners();
  }

}