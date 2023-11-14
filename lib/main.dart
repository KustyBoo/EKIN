// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_btn_intro.dart';
import 'package:pa_ekin/models/provider_icon_nav.dart';
import 'package:pa_ekin/models/provider_review.dart';
import 'package:pa_ekin/models/provider_screen_index.dart';
import 'package:pa_ekin/screens/Collection.dart';
import 'package:pa_ekin/screens/Collection_review.dart';
import 'package:pa_ekin/screens/Home.dart';
import 'package:pa_ekin/screens/Introduction_screen.dart';
import 'package:pa_ekin/screens/abouUs.dart';
import 'package:pa_ekin/screens/signInPage.dart';
import 'package:pa_ekin/screens/signuUpPage.dart';
import 'package:pa_ekin/screens/success.dart';
import 'package:pa_ekin/widgets/bottom_nav_bar.dart';
import 'package:pa_ekin/widgets/scroll_behaviour.dart';
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
        // provider button intro screen
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              ProviderBtnVisibleCounter(btnbaru: btn),
        ),

        // provider index screen bottom nav
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderIndexScreenData(),
        ),

        // provider icon bottom nav
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderIconNav(),
        ),

        // provider review
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderReview(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // ScrollConfiguration untuk mengatur splash saat page ditarik
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ScrBehaviour(),
            child: child!,
          );
        },

        theme: ThemeData(
          colorScheme: colorMode,
          textTheme: teksMode,
          elevatedButtonTheme: btnMode,
          iconTheme: iconMode,
          scaffoldBackgroundColor: Colors.transparent,
        ),

        routes: {
          "/IntroPage": (context) => IntroductionPage(),
          "/SignInPage": (context) => SignInPage(),
          "/SignUpPage": (context) => SignUpPage(),
          "/SuccessPage": (context) => SuccessPage(),
          "/HomePage": (context) => HomePage(),
          "/CollectionPage": (context) => CollectionPage(),
          "/CollectionReviewPage": (context) => CollectionReviewPage(),
          "/AboutUsPage": (context) => AboutUsPage(),
          "/BottomNavPage": (context) => BottomNavBar(),
        },
        
        initialRoute: "/CollectionReviewPage", // inisialisasi rute
        
      ),
    );
  }
}
