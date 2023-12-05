// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/models/sepatu_models.dart';
import 'package:pa_ekin/screens/Collection_review.dart';
import 'package:pa_ekin/widgets/container_sepatu.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';
import '../models/user_models.dart' as my_models;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerSearch = TextEditingController();
  List<Sepatu> sepatuData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      fetchUsername();
      // sepatuData = await fetchSepatuData()
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

  // void handleSearch() {
  //   String searchTerm = _controllerSearch.text.toLowerCase();
  //   List<Sepatu> searchResults = sepatuData
  //       .where((sepatu) => sepatu.nama.toLowerCase().contains(searchTerm))
  //       .toList();

  //   print('Search Results: $searchResults');
  // }

  @override
  Widget build(BuildContext context) {
    String search = "";

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
            child: Form(
              key: _formKey,
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
                                        child: TextFormField(
                                          controller: _controllerSearch,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Silakan pencarian anda';
                                            }
                                            return null;
                                          },
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
                                          onChanged: (value) {
                                            // handleSearch();
                                            search = _controllerSearch.text;
                                            setState(() {});
                                          },
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
                        //container kotak hijau dg gambar foto
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 17,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 152,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: colorMode.primary, width: 1),
                          ),
                          child: Image(
                            image: AssetImage("assets/Group_89.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //container whats new dan garis putih
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
                                "What's New",
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
                        //container pembungkus seluruh sepatu sepatu
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 121,
                          child: ContainerHorizontal(pilihan: 1, data: search)
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //container Most Rated dan garis putih
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
                                "Most Rated",
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
                        //container pemersatu 3 sepatu bawah
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 125,
                          child: ContainerHorizontal(pilihan: 2, data: ""),
                        ),
                        SizedBox(
                          height: 16,
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
                                "Today's Pick",
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
                        //container di bawah todays pick
                        ContainerHorizontal(pilihan: 3, data: ""),
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

