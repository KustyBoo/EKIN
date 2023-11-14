// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class ContainerReview extends StatelessWidget {
  String nama;
  String deskripsi;

  ContainerReview({
    super.key,
    required this.nama,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Container(
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
                  width: 102,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1,
                        color: colorMode.primary,
                      ),
                    ),
                  ),
                  child: Text(
                    "AlexBanjarmasin123",
                    style: TextStyle(
                        fontFamily: "dity",
                        fontSize: 12,
                        letterSpacing: 0,
                        color: colorMode.onPrimary),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1,
                        color: colorMode.primary,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bintang.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bintang.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bintang.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bintang.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bintang.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 68,
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: colorMode.primary,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
            ),
            child: Text(
              "very good me like, 100 stars",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}