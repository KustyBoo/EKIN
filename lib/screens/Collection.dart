// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/widgets/container_sepatu.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String? username = '';

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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //container bg
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
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
                                  username!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
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
                      SizedBox(
                        height: 8,
                      ),
                      //container Todays dan garis putih
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
                              "Latest Pick",
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
                      SizedBox(
                        height: 12,
                      ),
                      //container di bawah latest pick
                      ContainerHorizontal(pilihan: 3, data: ""),
                      SizedBox(
                        height: 16,
                      ),
                      //container pemersatu collection dan garis kanan kirinya
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            //container garis kiri
                            Expanded(
                              child: Container(
                                height: 1,
                                color: colorMode.onPrimary,
                              ),
                            ),
                            //container Collection/tengah
                            Container(
                              margin: EdgeInsets.only(
                                right: 11,
                                left: 11,
                              ),
                              height: 25,
                              child: Text(
                                "Collection",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            //container garis kanan
                            Expanded(
                              child: Container(
                                height: 1,
                                color: colorMode.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      //container pemersatu bawah collection
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            //container price
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: colorMode.primary, width: 1),
                                  color: colorMode.primary,
                                ),
                                child: Text(
                                  "Price",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            //container brand
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: colorMode.primary, width: 1),
                                ),
                                child: Text(
                                  "Brand",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            //container color
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: colorMode.primary, width: 1),
                                ),
                                child: Text(
                                  "Color",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            //container year
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: colorMode.primary, width: 1),
                                ),
                                child: Text(
                                  "Year",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //container pemersatu sort by dan set filter
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            //container sort by dan button sampingnya
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Sort By: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "dity",
                                          color: colorMode.onPrimary),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    //container pemersatu button
                                    Container(
                                      height: 26,
                                      child: Row(
                                        children: [
                                          //container panah atas
                                          Container(
                                            width: 32,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              color: colorMode.primary,
                                              border: Border.all(
                                                  color: colorMode.primary),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.expand_less,
                                              color: colorMode.onPrimary,
                                            ),
                                          ),
                                          Container(
                                            width: 32,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: colorMode.primary),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.expand_more,
                                              color: colorMode.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 6,
                                bottom: 6,
                              ),
                              width: 140,
                              height: 36,
                              decoration: BoxDecoration(
                                color: colorMode.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.manage_search,
                                      color: colorMode.onPrimary,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4,
                                      bottom: 4,
                                      left: 3,
                                    ),
                                    child: Text(
                                      "Set Filter",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "dity",
                                          color: colorMode.onPrimary),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //container garis
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Divider(
                          thickness: 1,
                          color: colorMode.onPrimary,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //pemersatu kotak kotak sepatu di bawah garis putih
                      ContainerHorizontal(pilihan: 4, data: ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
