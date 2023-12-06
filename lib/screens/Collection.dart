// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_ekin/models/provider_filter.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/models/sepatu_models.dart';
import 'package:pa_ekin/widgets/container_sepatu.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class CollectionPage extends StatefulWidget {
  CollectionPage({super.key, required this.sorting, required this.urutan});
  String sorting;
  bool urutan;

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final ValueNotifier<bool> selected = ValueNotifier<bool>(false);

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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )
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
                      ContainerHorizontal(
                        pilihan: 3,
                        data: "",
                        urutan: false,
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
                        child: FilterBtn(),
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
                                      width: 64,
                                      height: 26,
                                      child: Consumer<ProviderAscDesc>(
                                        builder: (context, ascdesc, child) {
                                          return Wrap(
                                            spacing: 0,
                                            children: List.generate(
                                              ascdesc.btnCount,
                                              (index) {
                                                var item =
                                                    ascdesc.ascDesc[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    ascdesc.updateBtn(index);
                                                    if (index == 0) {
                                                      widget.urutan = false;
                                                    }
                                                    if (index == 1) {
                                                      widget.urutan = true;
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 32,
                                                    height: 26,
                                                    decoration: BoxDecoration(
                                                      color: item.bgColor,
                                                      border: Border.all(
                                                          color: colorMode
                                                              .primary),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: item.topleft,
                                                        topRight: item.topRight,
                                                        bottomLeft:
                                                            item.bottomLeft,
                                                        bottomRight:
                                                            item.bottomRight,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      item.iconArrow,
                                                      color: item.foreColor,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Consumer<ProviderFilter>(
                              builder: (context, filter, child) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(filter.filterClicked.contains(0)){
                                        widget.sorting = "Harga";
                                        print(widget.sorting);
                                        print(widget.urutan);
                                      }
                                      if(filter.filterClicked.contains(1)){
                                        widget.sorting = "Brand";
                                      }
                                      if(filter.filterClicked.contains(2)){
                                        widget.sorting = "Color";
                                      }
                                      if(filter.filterClicked.contains(3)){
                                        widget.sorting = "Year";
                                      }

                                    });
                                  },
                                  child: Container(
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
                                );
                              },
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
                      ContainerHorizontal(
                          pilihan: 4,
                          data: widget.sorting,
                          urutan: widget.urutan),
                    ],
                  ),
                ),
              ],
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

class FilterBtn extends StatefulWidget {
  FilterBtn({super.key});

  @override
  State<FilterBtn> createState() => _FilterBtnState();
}

class _FilterBtnState extends State<FilterBtn> {
  String sorting = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderFilter>(
      builder: (context, filter, child) {
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 7,
          runSpacing: 7,
          children: List.generate(
            filter.btnCount,
            (index) {
              var item = filter.filterData[index];
              return GestureDetector(
                onTap: () {
                  filter.updateBtn(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.205,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorMode.primary, width: 1),
                    color: item.bgColor,
                  ),
                  child: Text(
                    item.nama,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
