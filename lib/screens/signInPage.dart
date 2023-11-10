import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerUserName.dispose();
    _controllerPassword.dispose();
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
                margin: EdgeInsets.only(top: 200),
                alignment: Alignment.center,
                child: Text("Login",
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
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
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
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
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(left: 70, right: 70),
                child: Column(
                  children: [
                    Container(
                      child: Text("Don't Have an Account?",
                      style:Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Text("Sign Up",
                        style:Theme.of(context).textTheme.bodySmall
                        ),
                      ),
                      
                    )
                  ],
                ),
              ),
              SizedBox(height: 180,),
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
