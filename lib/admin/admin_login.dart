import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse_admin/admin/admin_home.dart';
import 'package:peaceful_pulse_admin/constants/custom_colors.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _isObscured = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _adminEmail = 'admin@example.com';
  final String _adminPassword = 'admin123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/home_image.png'), opacity: 0.7)),
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CustomColors.adminPrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white10,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 3.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Center(
                                  child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Email Address",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                style: const TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _isObscured,
                                enabled: true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscured = !_isObscured;
                                        });
                                      },
                                      icon: _isObscured
                                          ? const Icon(CupertinoIcons.eye_slash)
                                          : const Icon(CupertinoIcons.eye),
                                    ),
                                    hintText: "Password",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                style: const TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            String email = _emailController.text;
                                            String password = _passwordController.text;

                                            if (email == _adminEmail && password == _adminPassword) {
                                              // Navigate to the admin dashboard
                                              // Navigator.pushReplacementNamed(context, '/admin_dashboard');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const AdminHome()));
                                            } else {
                                              // Show an error message
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Invalid email or password')),
                                              );
                                            }
                                            // /////////////
                                            // FirebaseAuth.instance
                                            //     .signInWithEmailAndPassword(
                                            //         email: _emailController.text,
                                            //         password:
                                            //             _passwordController.text)
                                            //     .then((value) => Navigator.push(
                                            //             context,
                                            //             MaterialPageRoute(
                                            //                 builder: (context) =>
                                            //                     const AdminHome()))
                                            //         .onError((error,
                                            //                 stackTrace) =>
                                            //             (error, stackTrace) {
                                            //               print("Error: $error");
                                            //             }));
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                CustomColors.primaryColor),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color:
                                                    CustomColors.secondaryColor),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("----------------OR------------------"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.twitter,
                                        color: Colors.black,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
