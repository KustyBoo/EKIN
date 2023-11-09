import 'package:flutter/material.dart';

class BtnVisible {

  // boolean untuk menyembunyikan dan memperlihatkan button
  bool btnNext = true;
  bool btnContinue = false;

  // fungsi untuk menyembunyikan dan memperlihatkan button
  void toggleBtn(){
    btnNext = !btnNext;
    btnContinue = !btnContinue;
  }

  // fungsi untuk reset boolean ke awal
  void toggleDownBtn(){
    btnNext = true;
    btnContinue = false;
  }

}

class ProviderBtnVisibleCounter extends ChangeNotifier{
  // variabel untuk update button
  BtnVisible btnbaru;

  ProviderBtnVisibleCounter({required this.btnbaru});

  // fungsi untuk update button
  void updateBtn(){
    btnbaru.toggleBtn();
    notifyListeners();
  }

  // fungsi untuk reset button
  void resetBtn(){
    btnbaru.toggleDownBtn();
    notifyListeners();
  }

}