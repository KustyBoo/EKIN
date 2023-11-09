// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pa_ekin/models/provider_btn_intro.dart';
import 'package:provider/provider.dart';

class IntroductionPage extends StatelessWidget {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    dynamic updateButton =
        Provider.of<ProviderBtnVisibleCounter>(context, listen: false);

    bool btnNext =
        Provider.of<ProviderBtnVisibleCounter>(context).btnbaru.btnNext;

    bool btnContinue =
        Provider.of<ProviderBtnVisibleCounter>(context).btnbaru.btnContinue;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        exit(0);
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            IntroductionScreen(
              key: _introKey,
              globalBackgroundColor: Colors.transparent,
              showDoneButton: false,
              showBackButton: false,
              showNextButton: false,
              controlsPadding: EdgeInsets.only(bottom: 25),
              dotsDecorator: DotsDecorator(
                // melakukan styling terhadap dots indikator page
                size: const Size.square(10.0),
                activeSize: const Size(10.0, 10.0),
                activeColor: Color(0xFFA8E25C),
                color: Colors.white,
                spacing: const EdgeInsets.symmetric(horizontal: 10.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
              onChange: (page) {
                // listener yang digunakan untuk menghitung pergantian halaman
                // yang kemudian merubah tulisan tombol skip menjadi continue
                if (page == 1) {
                  updateButton.resetBtn();
                }
                if (page == 2) {
                  updateButton.updateBtn();
                }
              },
              pages: [
                PageViewModel(
                  // menonaktifkan scroll untuk singlechildscrollview
                  useScrollView: false,
                  title: "",
                  bodyWidget: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(
                        25, MediaQuery.of(context).size.height * 0.3, 25, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 84,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/EKIN_Logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Level up your shoe game.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "dity",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: PageDecoration(
                    contentMargin: EdgeInsets.all(0),
                  ),
                ),
                PageViewModel(
                  title: "",
                  bodyWidget: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.10, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 222,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Intro_2.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Trending",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Showcasing the latest shoe collections, trends, styles, and fashionable shoe choices.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: PageDecoration(
                    contentMargin: EdgeInsets.all(0),
                  ),
                ),
                PageViewModel(
                  title: "",
                  bodyWidget: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.10, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 222,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Intro_3.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Explore",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Explore and discover over 2000 pairs and counting with our features. Showcasing the latest shoe trends and styles.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: PageDecoration(
                    contentMargin: EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: btnNext,
              child: Positioned(
                right: 20,
                left: 20,
                bottom: 55,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _introKey.currentState?.next();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: Text("Next"),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: btnContinue,
              child: Positioned(
                right: 20,
                left: 20,
                bottom: 55,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/");
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: Text("Continue"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
