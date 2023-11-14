import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
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
                          border: Border.all(
                              color: colorMode.primary, width: 1),
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
                              style:
                                  Theme.of(context).textTheme.displayLarge,
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
                              style:
                                  Theme.of(context).textTheme.displayLarge,
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
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            //container sepatu 1
                            Expanded(
                              flex: 3,
                              child: Container(
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
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 11.5,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: colorMode.primary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10),
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
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      //container view
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: colorMode.primary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10),
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
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            //container sepatu 2
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 93,
                                height: 121,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: colorMode.primary,
                                        width: 1)),
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
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      //container view
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: colorMode.primary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10),
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
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            //container sepatu 3
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 93,
                                height: 121,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: colorMode.primary,
                                        width: 1)),
                                child: Stack(
                                  children: [
                                    //ngeset container paling besar
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
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      //container view
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: colorMode.primary,
                                          borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(10),
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
                            ),
                          ],
                        ),
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
                              style:
                                  Theme.of(context).textTheme.displayLarge,
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
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 152,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: colorMode.primary, width: 1),
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
                                  "\$100.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              top: 0,
                              //container image
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.5,
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
                                      width:
                                          MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height,
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
                        height: 20,
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
