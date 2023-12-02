// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_shoe_reviews.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/models/reviews_models.dart';
import 'package:pa_ekin/services/shoe_reviews_service.dart';
import 'package:pa_ekin/widgets/container_review.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class CollectionReviewPage extends StatefulWidget {
  CollectionReviewPage(
      {super.key,
      required this.namaSepatu,
      required this.urlSepatu,
      required this.descSepatu,
      required this.hargaSepatu,
      required this.ratingSepatu,
      required this.indexSepatu});

  String namaSepatu;
  String urlSepatu;
  String hargaSepatu;
  String ratingSepatu;
  String descSepatu;
  final int indexSepatu;

  @override
  State<CollectionReviewPage> createState() => _CollectionReviewPageState();
}

class _CollectionReviewPageState extends State<CollectionReviewPage> {
  final _formKey = GlobalKey<FormState>();
String? username = '';
String? email = '';
final TextEditingController _controllerReview = TextEditingController();

@override
void dispose() {
  super.dispose();
  _controllerReview.dispose();
}

@override
void initState() {
  super.initState();
  WidgetsBinding.instance!.addPostFrameCallback((_) async {
    fetchEmail();
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


void fetchEmail() async {
  try {
    var userProvider = Provider.of<ProviderUser>(context, listen: false);
    var user = userProvider.users.first;

    setState(() {
      email = user.email ?? '';
    });
  } catch (e) {
    print('Error fetching email: $e');
  }
}

void handleSubmit() async {
  if (!_formKey.currentState!.validate()) return;

  final review = _controllerReview.text;

  print('Nama Sepatu: ${widget.namaSepatu}');

  try {
    Reviews newReview = Reviews(
      username: email!,
      reviews: review,
    );

    Provider.of<ProviderShoeReviews>(context, listen: false)
        .addReview(newReview);

    String collectionName = "shoes";

    String documentId =
        await getDocumentId(collectionName, widget.namaSepatu);

    if (documentId.isNotEmpty) {
      String userEmail = email!;
      ShoeReviewsService shoeReviewsService = ShoeReviewsService();
      await shoeReviewsService.addReviewToFirebase(
          documentId, newReview, userEmail);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Berhasil Review'),
      ));
    } else {
      print('ID dokumen kosong');
    }
  } catch (e) {
    print('Review submission failed: $e');
  }
}


  Future<String> getDocumentId(String collectionName, String shoeName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("shoes")
          .where('Nama', isEqualTo: shoeName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print('Dokumen ditemukan: ${querySnapshot.docs.first.id}');
        return querySnapshot.docs.first.id;
      } else {
        print('Sepatu tidak ditemukan');
        return '';
      }
    } catch (e) {
      print("Error fetching document ID: $e");
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var indexSepatu = widget.indexSepatu;
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
          body: Form(
            key: _formKey,
            child: SafeArea(
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
                            widget.namaSepatu,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('shoes')
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            // Mendapatkan semua dokumen dalam koleksi sepatu
                            var shoesDocs = snapshot.data!.docs;
                            var sepatu = shoesDocs[indexSepatu];

                            // Sekarang, Anda dapat mengakses dokumen dengan indeks tertentu
                            return FutureBuilder<QuerySnapshot>(
                                future: sepatu.reference
                                    .collection('reviews')
                                    .get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot>
                                        reviewsSnapshot) {
                                  if (reviewsSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  }

                                  var reviewsDocs = reviewsSnapshot.data!.docs;

                                  return ListView(
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
                                                          image: NetworkImage(
                                                            widget.urlSepatu,
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
                                                        color:
                                                            colorMode.primary,
                                                        border: Border.all(
                                                          width: 1,
                                                          color:
                                                              colorMode.primary,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "\$${widget.hargaSepatu}",
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
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        widget.namaSepatu,
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
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 3),
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                "${widget.ratingSepatu}/5",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      "dity",
                                                                  color: colorMode
                                                                      .onPrimary,
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
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    AssetImage(
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
                                                        widget.descSepatu,
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Reviews",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge,
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
                                                        color:
                                                            colorMode.primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(13),
                                                        topRight:
                                                            Radius.circular(13),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 20,
                                                          height: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
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
                                                        color:
                                                            colorMode.primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(13),
                                                        bottomLeft:
                                                            Radius.circular(13),
                                                      ),
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          _controllerReview,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter your review';
                                                        }
                                                        return null;
                                                      },
                                                      maxLines: 3,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Type your review here",
                                                        hintStyle: TextStyle(
                                                          fontFamily: "dity",
                                                          fontSize: 16,
                                                          color: colorMode
                                                              .onPrimary
                                                              .withOpacity(0.7),
                                                        ),
                                                        border:
                                                            InputBorder.none,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        foregroundColor:
                                                            colorMode.onPrimary,
                                                        textStyle: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: "dity",
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          side: BorderSide(
                                                            width: 1,
                                                            color: colorMode
                                                                .onPrimary,
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            colorMode.primary,
                                                        foregroundColor:
                                                            colorMode.onPrimary,
                                                        textStyle: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: "dity",
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 38,
                                                          right: 38,
                                                          top: 8,
                                                          bottom: 8,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          side: BorderSide(
                                                            width: 1,
                                                            color: colorMode
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        handleSubmit();
                                                      },
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
                                      Container(
                                        width: 400,
                                        height: 400,
                                        child: ListView.builder(
                                          itemCount: reviewsDocs.length,
                                          itemBuilder: (context, index) {
                                            var nama = reviewsDocs[index]['Username'];
                                            var deskripsi =
                                                reviewsDocs[index]['Review'];
                                      
                                            return Column(
                                              children: [
                                                ContainerReview(
                                                  nama: nama,
                                                  deskripsi: deskripsi,
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
