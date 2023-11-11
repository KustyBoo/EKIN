import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
//import 'package:pa_ekin/widgets/theme_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPw = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerFullName.dispose(); 
    _controllerUserName.dispose();
     _controllerEmail.dispose();
    _controllerPassword.dispose();
     _controllerConfirmPw.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/background.png"),
        fit: BoxFit.cover,
      )
      ),
      child: Scaffold(
        body: Container(
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
                flex: 10,
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 100, left: 30),
                  child: Text("Your journey\nstarts here.",
                      style: Theme.of(context).textTheme.headlineMedium
                      ),
                  ),
                ),
               Expanded(
                 flex: 20,
                 child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top : 40),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText:
                          "Full Name", 
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colorMode.onPrimaryContainer, // Warna border
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, //agar label selalu naik
                      contentPadding: EdgeInsets.symmetric(vertical: 10)//atur jarak label and inputan
                    ),
                  ),
                 ),
               ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top : 10),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText:
                          "Username", // Label akan hilang saat pengguna mengetik
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colorMode.onPrimaryContainer, // Warna border
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, //agar label selalu naik
                      contentPadding: EdgeInsets.symmetric(vertical: 10)//atur jarak label and inputan
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top : 10),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText:
                          "Email", // Label akan hilang saat pengguna mengetik
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colorMode.onPrimaryContainer, // Warna border
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, //agar label selalu naik
                      contentPadding: EdgeInsets.symmetric(vertical: 10)//atur jarak label and inputan
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top : 10),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText:
                          "Password", // Label akan hilang saat pengguna mengetik
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colorMode.onPrimaryContainer, // Warna border
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, //agar label selalu naik
                      contentPadding: EdgeInsets.symmetric(vertical: 10)//atur jarak label and inputan
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top : 30),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText:
                          "Confirm Password", // Label akan hilang saat pengguna mengetik
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colorMode.onPrimaryContainer, // Warna border
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always, //agar label selalu naik
                      contentPadding: EdgeInsets.symmetric(vertical: 10)//atur jarak label and inputan
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 80),
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
      ),
    );
  }
}
