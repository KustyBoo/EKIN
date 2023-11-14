// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
                                    "Lix",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
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
                                          child: Container(
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/content_copy.png"),
                                              width: 24,
                                              height: 24,
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
                                          child: Container(
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/content_copy.png"),
                                              width: 24,
                                              height: 24,
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
      ],
    );
  }
}
