// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pa_ekin/services/auth_services.dart';
import 'package:pa_ekin/models/provider_user.dart';
import 'package:pa_ekin/screens/Home.dart';
import 'package:pa_ekin/widgets/theme_data.dart';
import 'package:provider/provider.dart';
import '../models/user_models.dart' as my_models;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _controllerEmail.value.text;
    final password = _controllerPassword.value.text;
    setState(() => _loading = true);

    try {
      my_models.User? loggedInUser =
          await Provider.of<AuthServices>(context, listen: false)
              .signIn(email, password);

      if (loggedInUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Anda adalah: ${loggedInUser.fullName}'),
          ),
        );
        Provider.of<ProviderUser>(context, listen: false).addUser(loggedInUser);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to login. Please check your credentials."),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");

      String errorMessage = "Failed to login. Please check your credentials.";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
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
                            child: TextFormField(
                              controller: _controllerEmail,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Silakan Masukkan Email Anda';
                                }
                                return null;
                              },
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
                            child: TextFormField(
                              controller: _controllerPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Silakan Masukkan Password Anda';
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
                                flex: 6,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                    top: 40,
                                  ),
                                  child: Text(
                                    "Don't Have an Account?",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Container(
                                  margin: EdgeInsets.only(top: 35),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/SignUpPage");
                                    },
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
                        SizedBox(
                          height: 140,
                        ),
                        Container(
                          //margin: EdgeInsets.only(bottom: 100),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                handleSubmit();
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
                    )
                  ],
                ),
              ),
            )
          ],
            ),
        ),
      )     
      );
  }
}
