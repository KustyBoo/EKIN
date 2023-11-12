// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
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
                                  "Lix",
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
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 152,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: colorMode.primary, width: 1),
                        ),
                        child: Stack(
                          children: [
                            //container paling besar
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            ),
                            //container tulisan harga
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                alignment: Alignment.center,
                                height: 22.45,
                                width: 97,
                                decoration: BoxDecoration(
                                  color: colorMode.primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "\$100.00",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              top: 0,
                              //container image
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                            Positioned(
                              right: 16,
                              top: 25,
                              bottom: 11,
                              //container tulisan samping image
                              child: Container(
                                width: 125,
                                height: 109,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                    ),
                                    //container more
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: colorMode.primary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(6),
                                            topLeft: Radius.circular(6),
                                          ),
                                        ),
                                        child: Text(
                                          "\$100.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
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
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 16,
                          children: [
                            //container kotak 1
                            Container(
                              width: 93,
                              height: 121,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 93,
                                    height: 121,
                                  ),
                                  //container tulisan harga
                                  Container(
                                    alignment: Alignment.center,
                                    height: 11.5,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: colorMode.primary,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        color: colorMode.primary,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "\$100.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    //container view
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(13),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: colorMode.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        "View",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //container kotak 2
                            Container(
                              width: 93,
                              height: 121,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 93,
                                    height: 121,
                                  ),
                                  //container tulisan harga
                                  Container(
                                    alignment: Alignment.center,
                                    height: 11.5,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: colorMode.primary,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        color: colorMode.primary,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "\$100.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    //container view
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(13),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: colorMode.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        "View",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //container kotak 3
                            Container(
                              width: 93,
                              height: 121,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 93,
                                    height: 121,
                                  ),
                                  //container tulisan harga
                                  Container(
                                    alignment: Alignment.center,
                                    height: 11.5,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: colorMode.primary,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        color: colorMode.primary,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "\$100.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    //container view
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(13),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: colorMode.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        "View",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //container kotak 4
                            Container(
                              width: 93,
                              height: 121,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 93,
                                    height: 121,
                                  ),
                                  //container tulisan harga
                                  Container(
                                    alignment: Alignment.center,
                                    height: 11.5,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: colorMode.primary,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        color: colorMode.primary,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "\$100.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    //container view
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 22,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(13),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: colorMode.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        "View",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
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
