import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
            Column(
              children: [
                //container search dan logo
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 68,
                  color: Colors.red,
                  child: Row(children: [
                    Expanded(
                      flex: 9,
                      //container pembungkus search bar
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                        ),
                        height: 47,
                        color: Colors.yellow,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
                          height: 35,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Search",
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
                                    color: Colors.green,
                                    border: Border(
                                      left: BorderSide(
                                          width: 3, color: Colors.white),
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
                          color: Colors.black,
                          child: Column(children: [
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
                              height: 3,
                            ),
                            Container(
                              child: Text(
                                "LIX",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          ]),
                        )),
                  ]),
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
                            Divider(
                              thickness: 1,
                              color: colorMode.onPrimary,
                              height: 14,
                              endIndent: 0,
                              indent: 0,
                            )
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
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            //container sepatu 1
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              width: 93,
                              height: 121,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: colorMode.primary, width: 1)),
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
                                          bottomRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(11),
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
                                  Positioned(
                                    top: 12,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 56,
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    right: 10,
                                    bottom: 23,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 29,
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
