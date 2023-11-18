// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';

import '../models/provider_user.dart';
import '../models/user_models.dart';
import '../services/auth_services.dart';
//import 'package:pa_ekin/widgets/theme_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  AuthServices _auth = AuthServices();
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

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

  void handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _controllerFullName.text;
    final username = _controllerUserName.text;
    final email = _controllerEmail.text;
    final password = _controllerPassword.text;
    final confirmPassword = _controllerConfirmPw.text;

    if (password != confirmPassword) {
      return;
    }

    setState(() => _loading = true);

    try {
      await _auth.signUp(fullName, username, email, password, confirmPassword);

      User newUser = User(
        fullName: fullName,
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      Provider.of<ProviderUser>(context, listen: false).addUser(newUser);
      // Navigasi ke halaman success jika diperlukan
      // Navigator.pushNamed(context, "/SuccessPage");
    } catch (e) {
      print('Registration failed: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Stack(
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
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              width: MediaQuery.of(context).size.width,
                              height: 24,
                              child: Image.asset("assets/buttonBack.png"),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              "Your journey\nstarts here.",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                controller: _controllerFullName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                                obscureText: false,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextField(
                                controller: _controllerUserName,
                                obscureText: false,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                controller: _controllerEmail,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                obscureText: false,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                controller: _controllerPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextFormField(
                                controller: _controllerConfirmPw,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
                                  }
                                  return null;
                                },
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            //margin: EdgeInsets.only(bottom: 100),
                            width: MediaQuery.of(context).size.width,
                            child:
                                // ElevatedButton(
                                //   onPressed: () {
                                //     handleSubmit();
                                //     Navigator.pop(context);
                                //     Navigator.pushNamed(context, "/SuccessPage");
                                //   },
                                //   style: ElevatedButton.styleFrom(
                                //     minimumSize: Size(
                                //         MediaQuery.of(context).size.width * 0.9, 50),
                                //   ),
                                //   child: Text("Sign-up"),
                                // ),
                            ElevatedButton(
                              onPressed: () {
                                handleSubmit();
                                Navigator.pop(context);
                                Navigator.pushNamed(context, "/SuccessPage");
                              },
                              child: _loading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text("Submit"),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.9,
                                  50,
                                ),
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

