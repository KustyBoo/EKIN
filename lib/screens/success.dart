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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 31, right: 290),
              child: TextButton(
                onPressed: (){},
                 child:
                 Container(
                   width: 24,
                   height: 24,
                   child: Image.asset("assets/buttonBack.png")
                   )
                 ),   
            ),
            Container(
                margin: EdgeInsets.only(top: 60, right: 90),
                alignment: Alignment.center,
                child: Text("Registration\nsuccesful.",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            SizedBox(height: 30,),
            Container(
                   width: 320,
                   height: 270,
                   child: Image.asset("assets/Success.png")
              ),
            SizedBox(height: 120,),
            Container(
                 child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50,),
                    ),
                    child: Text("Continue"),
                  ),
              )
             
          ],
        ),
      ),
    );
  }
}