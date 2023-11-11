import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )
        ),
        child: ListView(
          children: [
            Stack(
              children:[
                TextButton(
                onPressed: (){},
                 child:
                 Container(
                  margin: EdgeInsets.only(top: 25, left: 15),
                   width: MediaQuery.of(context).size.width,
                   height: 24,
                   child: Image.asset("assets/buttonBack.png"),
                   alignment: Alignment.topLeft,
                   )
                  
                 ),
              ]
            ),
            Expanded(
              flex: 30,
              child:
               Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 100, left: 30),
                  child: Text("Registration\nsuccesful.",
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
            ),
            Expanded(
              child:
               Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.only(top: 30),
                   width: MediaQuery.of(context).size.width,
                   height: 270,
                   child: Image.asset("assets/Success.png")
                ),
            ),
            Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  width: MediaQuery.of(context).size.width,
                   child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50,),
                      ),
                      child: Text("Sign In"),
                    ),
                    alignment: Alignment.bottomCenter,
                ),
              )
             
          ],
        ),
      ),
    );
  }
}