import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _controllerUserName.dispose();
    _controllerPassword.dispose();
    super.dispose();
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
               children: [
                 Column(
                    children: [
                      SizedBox(height: 200),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: TextField(
                            controller: _controllerUserName,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(top: 40,),
                                child: Text(
                                  "Don't Have an Account?",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(top: 35),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                               
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 140,),
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
                          child: Text("Sign-In"),
                        ),
                        alignment: Alignment.bottomCenter,
                      )
                    ],
                  )
               ],

                ),
          ),
        )
      ],
    ));
  }
}