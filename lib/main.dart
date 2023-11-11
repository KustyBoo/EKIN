// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_btn_intro.dart';
import 'package:pa_ekin/screens/Home.dart';
import 'package:pa_ekin/screens/Introduction_screen.dart';
import 'package:pa_ekin/screens/signInPage.dart';
import 'package:pa_ekin/screens/signuUpPage.dart';
import 'package:pa_ekin/screens/success.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BtnVisible btn = BtnVisible();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              ProviderBtnVisibleCounter(btnbaru: btn),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: colorMode,
          textTheme: teksMode,
          elevatedButtonTheme: btnMode,
          scaffoldBackgroundColor: Colors.transparent,
        ),
        routes: {
          "/IntroPage": (context) => IntroductionPage(),
          "/SignInPage": (context) => SignInPage(),
          "/SignUpPage": (context) => SignUpPage(),
          "/SuccessPage":(context) => SuccessPage(),
          "/HomePage":(context) => HomePage(),
        },
        initialRoute: "/SuccessPage", // inisialisasi rute
      ),
    );
  }
}
