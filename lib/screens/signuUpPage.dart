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
                child: Text("Your journey\nstarts here.",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
               Container(
                padding: EdgeInsets.only(left: 30, right: 30, top : 30),
                child: TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    labelText:
                        "Full Name", // Label akan hilang saat pengguna mengetik
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
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top : 30),
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
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top : 30),
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
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top : 30),
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
              Container(
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
              SizedBox(height: 45,),
              Container(
                 child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50,),
                    ),
                    child: Text("Sign In"),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
