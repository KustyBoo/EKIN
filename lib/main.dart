// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_btn_intro.dart';
import 'package:pa_ekin/models/provider_filter.dart';
import 'package:pa_ekin/models/provider_icon_nav.dart';
import 'package:pa_ekin/models/provider_rating.dart';
import 'package:pa_ekin/models/provider_review.dart';
import 'package:pa_ekin/models/provider_screen_index.dart';
import 'package:pa_ekin/models/provider_shoe_reviews.dart';
import 'package:pa_ekin/screens/Collection.dart';
import 'package:pa_ekin/screens/Home.dart';
import 'package:pa_ekin/screens/Introduction_screen.dart';
import 'package:pa_ekin/screens/abouUs.dart';
import 'package:pa_ekin/screens/signInPage.dart';
import 'package:pa_ekin/screens/signUpPage.dart';
import 'package:pa_ekin/screens/success.dart';
import 'package:pa_ekin/widgets/bottom_nav_bar.dart';
import 'package:pa_ekin/widgets/scroll_behaviour.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/provider_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'services/auth_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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

        // provider button filter
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderFilter(),
        ),

        // provider button ascending descending
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderAscDesc(),
        ),

        // provider image rating
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderRating(),
        ),

        // provider review
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderReview(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderUser(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderShoeReviews(),
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
          "/CollectionPage": (context) =>
              CollectionPage(sorting: "", urutan: false),
          "/AboutUsPage": (context) => AboutUsPage(),
          "/BottomNavPage": (context) => BottomNavBar(),
        },

        initialRoute: "/IntroPage", // inisialisasi rute
        home: StreamBuilder<User?>(
          stream: firebase_auth.FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomNavBar();
            } else {
              return SignInPage();
            }
          },
        ),
      ),
    );
  }
}
