// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/container_review.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class CollectionReviewPage extends StatefulWidget {
  const CollectionReviewPage({super.key});

  @override
  State<CollectionReviewPage> createState() => _CollectionReviewPageState();
}

class _CollectionReviewPageState extends State<CollectionReviewPage> {
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
                //container back dan nama sepat
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 68,
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Text(
                          "Air Force 1’07 :  Triple White",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // Container gambar dan deskripsi sepatu
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 164,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 24,
                                    left: 24,
                                    child: Container(
                                      width: 271,
                                      height: 164,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/sepatu_placeholder.png",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 70,
                                    child: Container(
                                      width: 66,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/dekorasi_3.png",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    left: 9,
                                    child: Container(
                                      width: 66,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/dekorasi_1.png",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 9,
                                    left: 9,
                                    child: Container(
                                      width: 66,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/dekorasi_2.png",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 3,
                                        bottom: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorMode.primary,
                                        border: Border.all(
                                          width: 1,
                                          color: colorMode.primary,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "~\$4500.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: colorMode.primary,
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 27,
                                  right: 27,
                                  top: 14,
                                  bottom: 14,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Air Force 1’07 :  Triple White",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "4.7/5",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "dity",
                                                  color: colorMode.onPrimary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Container(
                                            width: 21,
                                            height: 21,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/bintang.png",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      child: Text(
                                        "The radiance lives on in the Nike Air Force 1 ’07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine. The stitched overlays on the upper add heritage style, durability and support. Originally designed for performance hoops, the Nike Air cushioning adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
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
                      //container tulisan Reviews dan garis putih
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
                              "Reviews",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(
                              width: 13,
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
                        height: 16,
                      ),
                      // Container luar review dan button
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            // Container review
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 4.5,
                                      left: 7.4,
                                      bottom: 5.2,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: colorMode.primary,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(13),
                                        topRight: Radius.circular(13),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/bintang.png"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/bintang.png"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/bintang.png"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/bintang.png"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/bintang.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // container text field review
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: colorMode.primary,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(13),
                                        bottomLeft: Radius.circular(13),
                                      ),
                                    ),
                                    child: TextField(
                                      maxLines: 3,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText: "Type your review here",
                                        hintStyle: TextStyle(
                                          fontFamily: "dity",
                                          fontSize: 16,
                                          color: colorMode.onPrimary
                                              .withOpacity(0.7),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            // Container button
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: colorMode.onPrimary,
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "dity",
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side: BorderSide(
                                            width: 1,
                                            color: colorMode.onPrimary,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text("Clear"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.5,
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: colorMode.primary,
                                        foregroundColor: colorMode.onPrimary,
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "dity",
                                        ),
                                        padding: EdgeInsets.only(
                                          left: 38,
                                          right: 38,
                                          top: 8,
                                          bottom: 8,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side: BorderSide(
                                            width: 1,
                                            color: colorMode.primary,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text("Save"),
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
                      // container garis
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
                        height: 21,
                      ),
                      // container lihat review
                      ContainerReview(
                        nama: "AlexBanjarmasin123",
                        deskripsi: "very good me like, 100 stars",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ContainerReview(
                        nama: "DwightKSchrute",
                        deskripsi:
                            "what the hell, dont even get me started, this thing takes hours and hours to clean, not to mention the smoothest and brightest white ive ever seen",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ContainerReview(
                        nama: "AffhIyhh",
                        deskripsi:
                            "yes",
                      ),
                      SizedBox(
                        height: 25,
                      )
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
