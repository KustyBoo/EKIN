// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_ekin/models/sepatu_models.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class ContainerHorizontal extends StatelessWidget {
  int pilihan;
  ContainerHorizontal({super.key, required this.pilihan});

  Future<List<Sepatu>> fetchDataFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('shoes').get();

    List<Sepatu> dataList = querySnapshot.docs.map((document) {
      return Sepatu.fromMap(document.data() as Map<String, dynamic>);
    }).toList();

    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sepatu>>(
      future: fetchDataFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (!snapshot.hasError && pilihan == 1) {
          List<Sepatu> dataList = snapshot.data ?? [];
          return IsiContainer(sepatuData: dataList);
        } else if (!snapshot.hasError && pilihan == 2) {
          List<Sepatu> dataList = snapshot.data ?? [];
          return MostRatedContainer(sepatuData: dataList);
        } else if (!snapshot.hasError && pilihan == 3) {
          List<Sepatu> dataList = snapshot.data ?? [];
          return TodaysPickContainer(sepatuData: dataList);
        } else {
          return Text('Error: ${snapshot.error}');
        }
      },
    );
  }
}

class IsiContainer extends StatelessWidget {
  final List<Sepatu> sepatuData;

  IsiContainer({required this.sepatuData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sepatuData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/CollectionReviewPage");
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 20,
              right: index == sepatuData.length - 1 ? 20 : 0,
            ),
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
                    "\$${sepatuData[index].harga}",
                    style: Theme.of(context).textTheme.displaySmall,
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
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 55,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: Image(image: NetworkImage(sepatuData[index].url)),
                  ),
                ),
                Positioned(
                  left: 5,
                  right: 5,
                  bottom: 23,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      sepatuData[index].nama,
                      textAlign: TextAlign.center,
                      style: teksMode.titleSmall,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 38,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${sepatuData[index].rating.toString()}/5",
                          textAlign: TextAlign.center,
                          style: teksMode.titleSmall,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          child: Image(image: AssetImage('assets/bintang.png')),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MostRatedContainer extends StatelessWidget {
  final List<Sepatu> sepatuData;

  MostRatedContainer({required this.sepatuData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/CollectionReviewPage");
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 20,
              right: index == sepatuData.length - 1 ? 20 : 0,
            ),
            width: 110,
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
                    "\$${sepatuData[sepatuData.length - (index + 1)].harga}",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  //container view
                  child: Container(
                    alignment: Alignment.center,
                    height: 22,
                    width: 110,
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
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 55,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: Image(
                        image: NetworkImage(
                            sepatuData[sepatuData.length - (index + 1)].url)),
                  ),
                ),
                Positioned(
                  left: 5,
                  right: 5,
                  bottom: 23,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      sepatuData[sepatuData.length - (index + 1)].nama,
                      textAlign: TextAlign.center,
                      style: teksMode.titleSmall,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 38,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${sepatuData[index].rating.toString()}/5",
                          textAlign: TextAlign.center,
                          style: teksMode.titleSmall,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          child: Image(image: AssetImage('assets/bintang.png')),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TodaysPickContainer extends StatelessWidget {
  final List<Sepatu> sepatuData;

  TodaysPickContainer({required this.sepatuData}) {
    pickRandomNumber();
  }

  Random random = Random();
  int pickedNumber = 0;

  void pickRandomNumber() {
    pickedNumber = random.nextInt(sepatuData.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorMode.primary, width: 1),
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
                  bottomLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Text(
                sepatuData[pickedNumber].harga,
                style: Theme.of(context).textTheme.displaySmall,
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
              child: Image(
                image: NetworkImage(
                  sepatuData[pickedNumber].url,
                ),
              ),
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
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            sepatuData[pickedNumber].nama,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 36,
                          child: Text(
                            sepatuData[pickedNumber].description,
                            softWrap: true,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text("${sepatuData[pickedNumber].rating.toString()}/5", style: teksMode.titleSmall,),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                child: Image(image: AssetImage("assets/bintang.png")),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
                        "More",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
