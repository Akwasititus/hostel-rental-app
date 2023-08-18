import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'adminUpload.dart';
import 'fade_animation.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final hostelManegerEmail = TextEditingController();
  final hostelManegerPassword = TextEditingController();

  bool _isLoading = false;

  
  Future<void> _resetPassword() async {
    try {
      final String email = hostelManegerEmail.text;

      if (email.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password Reset Email Sent'),
              content: const Text(
                  'Check your email for instructions to reset your password.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please enter your email.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'An error occurred while sending the password reset email.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = hostelManegerEmail.text;
      final String password = hostelManegerPassword.text;

      setState(() {
        _isLoading = true; // Set loading state to true
      });

      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // Navigate to the next screen or perform other actions upon successful login.
        Get.off(const AdminUpload());
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please enter both email and password.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred while signing in.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false; // Set loading state to false after sign-in process
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: Card(child: CircularProgressIndicator()))
          : Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFcbe6f6)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: BackButton()),
                  FadeAnimation(10, Image.asset('assets/images/logo.png')),
                  Container(
                      
                      child: const FadeAnimation(
                        2,
                        Text(
                          "Agent",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            )),
                        margin: const EdgeInsets.only(top: 60),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                  // color: Colors.red,
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      left: 22, bottom: 20),
                                  child: const FadeAnimation(
                                    2,
                                    Text(
                                      "Agent Login",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.black87,
                                          letterSpacing: 2,
                                          fontFamily: "Lobster"),
                                    ),
                                  )),
                              FadeAnimation(
                                2,
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFcbe6f6),
                                            width: 2),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xFFcbe6f6),
                                              blurRadius: 20,
                                              offset: Offset(1, 1)),
                                        ],
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.email_outlined),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: TextFormField(
                                              controller: hostelManegerEmail,
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                label: Text(" E-mail ..."),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              FadeAnimation(
                                2,
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFcbe6f6),
                                            width: 2),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xFFcbe6f6),
                                              blurRadius: 10,
                                              offset: Offset(2, 2)),
                                        ],
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.password_outlined),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: TextFormField(
                                              obscuringCharacter: '*',
                                              obscureText: true,
                                              controller: hostelManegerPassword,
                                              maxLines: 1,
                                              decoration: const InputDecoration(
                                                label: Text(" Password ..."),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  FadeAnimation(
                                    10,
                                    ElevatedButton(
                                      onPressed: _signInWithEmailAndPassword,
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.blue,
                                          shadowColor: Colors.blue,
                                          elevation: 18,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Colors.blue,
                                                  Colors.blue
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                          width: 200,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  GestureDetector(
                                    onTap: _resetPassword,
                                    child: const Text(
                                      "Reset Password",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                  Column(
                                    children: [
                                      FadeAnimation(
                                        2,
                                        Container(
                                            width: double.infinity,
                                            height: 30,
                                            alignment: Alignment.center,
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: const Text(
                                              "Need an Account?",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: FadeAnimation(
                                          2,
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                onPrimary: Colors.purpleAccent,
                                                shadowColor:
                                                    Colors.purpleAccent,
                                                elevation: 18,
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Colors.purpleAccent,
                                                        Colors.deepPurpleAccent
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'Register as a Agent',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
    );
  }
}
