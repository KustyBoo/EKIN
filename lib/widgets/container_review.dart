// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_rating.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class ContainerReview extends StatelessWidget {
  String nama;
  String deskripsi;
  int rating;

  ContainerReview({
    super.key,
    required this.nama,
    required this.deskripsi,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    nama,
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
                  child: Wrap(
                    spacing: 5,
                    children: List.generate(
                      rating,
                      (index) {
                        return Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/bintang.png"),
                            ),
                          ),
                        );
                      },
                    ),
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
              deskripsi,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
