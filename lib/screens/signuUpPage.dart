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
    return Scaffold(
      body: Stack(
        children: [
          Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: BoxDecoration(
             image: DecorationImage(
             image: AssetImage("assets/background.png"),
             fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                    children :[
                      Column(
                      children: [
                         SizedBox(height: 25),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            width: MediaQuery.of(context).size.width,
                            height: 24,
                            child: Image.asset("assets/buttonBack.png"),
                            alignment: Alignment.topLeft,
                        ),
                        SizedBox(height: 100),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            "Your journey\nstarts here.",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: Padding(
                           padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorMode
                                      .onPrimary, // Ganti dengan warna border yang sesuai
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        ),
                         Container(
                          child: Padding(
                           padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorMode
                                      .onPrimary, // Ganti dengan warna border yang sesuai
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        ),
                         Container(
                          child: Padding(
                           padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorMode
                                      .onPrimary, // Ganti dengan warna border yang sesuai
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        ),
                         Container(
                          child: Padding(
                           padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorMode
                                      .onPrimary, // Ganti dengan warna border yang sesuai
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        ),
                         Container(
                          child: Padding(
                           padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: Theme.of(context).textTheme.bodyLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorMode
                                      .onPrimary, // Ganti dengan warna border yang sesuai
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 40,),
                    Container(
                      //margin: EdgeInsets.only(bottom: 100),
                      width: MediaQuery.of(context).size.width,
                      child:
                       ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.9, 50),
                        ),
                        child: Text("Sign-Un"),
                      ),
                      alignment: Alignment.bottomCenter,
                    )
                      ],
                    )
                    ]
                  
                ),
              ),
          )
        ],
      ),
    );
  }
}