// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String? username = '';
  final ValueNotifier<bool> selected = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      fetchUsername();
    });
  }

  void fetchUsername() async {
    try {
      var userProvider = Provider.of<ProviderUser>(context, listen: false);
      var user = userProvider.users.first;

      if (user != null) {
        setState(() {
          username = user.username ?? '';
          print('Fetched username: $username');
        });
      }
    } catch (e) {
      print('Error fetching username: $e');
    }
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Sign out successful");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  //container search dan logo
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 68,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          //container pembungkus search bar
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 12,
                              right: 12,
                            ),
                            height: 47,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextField(
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search",
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 40),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        border: Border(
                                          left: BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: colorMode.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              selected.value = !selected.value;
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.all(10),
                              height: 47,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 8,
                                            color: colorMode.onPrimary,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 8,
                                            color: colorMode.onPrimary,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 8,
                                            color: colorMode.onPrimary,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 8,
                                            color: colorMode.onPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      username!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text(
                                "Who we are",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                width: 8.5,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: colorMode.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 40, right: 40, top: 20),
                                  child: Image.asset("assets/EKIN_Logo.png")),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "An App Like no other. We review The Best Of The Best from\naround the world. Curated by by our Special Team, professionality is what you'll expect from us",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text(
                                "Contact",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                width: 8.5,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: colorMode.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 15,
                              ),
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 17,
                                top: 17,
                                bottom: 17,
                              ),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: colorMode.onPrimary, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage("assets/mail.png"),
                                          width: 30,
                                          height: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Email",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "@supportekin@gmail.com",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(text: "@supportekin@gmail.com"));
                                            },
                                            child: Container(
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/content_copy.png"),
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage("assets/call.png"),
                                          width: 30,
                                          height: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Phone",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "+62 811 - 5512 - 4422",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(text: "+6281155124422"));
                                            },
                                            child: Container(
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/content_copy.png"),
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text(
                                "Developers",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                width: 8.5,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: colorMode.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 15,
                              ),
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 17,
                                top: 17,
                                bottom: 17,
                              ),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: colorMode.onPrimary, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: colorMode.onPrimary,
                                          size: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Front - End Developer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Kania Putri Ananda",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: colorMode.onPrimary,
                                          size: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Front - End Developer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Nurmedina Maulidiah",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: colorMode.onPrimary,
                                          size: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Back - End Developer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Rismayanti",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: colorMode.onPrimary,
                                          size: 30,
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 21),
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Back - End Developer",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Felix Christopher Afrian",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          right: 20,
          child: ValueListenableBuilder<bool>(
            valueListenable: selected,
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  _signOut();
                  Navigator.pop(context);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: selected.value ? 150 : 0,
                  height: selected.value ? 50 : 0,
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(0, 8),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          child: Icon(
                            Icons.logout,
                            size: selected.value ? 24 : 0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            "Logout",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
