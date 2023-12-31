// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_ekin/models/provider_icon_nav.dart';
import 'package:pa_ekin/models/provider_screen_index.dart';
import 'package:pa_ekin/screens/Collection.dart';
import 'package:pa_ekin/screens/Home.dart';
import 'package:pa_ekin/screens/abouUs.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // provider untuk menghitung layar
    final screenIndexProvider = Provider.of<ProviderIndexScreenData>(context);

    // variabel untuk mengambil
    int currentScreenIndex = screenIndexProvider.currentScreenIndex;

    // provider untuk mengganti icon
    final iconProviderNav = Provider.of<ProviderIconNav>(context);

    Icon currentIconProvider = iconProviderNav.iconFAB;

    // membuat list halaman yang ditunjukka
    List<dynamic> screen = [
      HomePage(),
      CollectionPage(sorting: "", urutan: false),
      AboutUsPage(),
    ];

    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = await showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            content: Text(
              "Exit App?",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  exit(0);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        floatingActionButton: Container(
          width: 65,
          height: 65,
          child: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: FloatingActionButton(
              onPressed: () {
                screenIndexProvider.refreshScreen(1);
                iconProviderNav.refreshIcon();
              },
              backgroundColor: colorMode.onPrimary,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colorMode.onPrimary,
                      spreadRadius: 7,
                      blurRadius: 25,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: currentIconProvider,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: BottomNavigationBar(
              // mengambil index halaman yang saat ini dibuka
              currentIndex: currentScreenIndex,

              type: BottomNavigationBarType.fixed,

              backgroundColor: Colors.transparent,

              unselectedItemColor: colorMode.onPrimary,

              selectedItemColor: colorMode.onPrimary,

              selectedFontSize: 0,

              onTap: (index) {
                // melakukan refresh terhadap index halaman yang dibuka
                screenIndexProvider.refreshScreen(index);

                // melakukan reset terhadap icon halaman yang dibuka
                iconProviderNav.resetIcon();
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    currentScreenIndex == 0 ? Icons.home : Icons.home_outlined,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(null),
                  activeIcon: Icon(null),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    currentScreenIndex == 2
                        ? Icons.groups
                        : Icons.groups_outlined,
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: screen[currentScreenIndex],
      ),
    );
  }
}
