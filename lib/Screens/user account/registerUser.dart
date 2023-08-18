import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import '../../MotherPage/mother_page.dart';
import '../../admin_page/fade_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>(); // Create a global form key

  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userCurrentSchool = TextEditingController();
  final userPassword = TextEditingController();

  Future<void> setData() async {
    if (_formKey.currentState!.validate()) {
      // Validation successful
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', userName.text);
      prefs.setString('email', userEmail.text);
      prefs.setString('currentSchool', userCurrentSchool.text);
      prefs.setString('password', userPassword.text);

      // ScaffoldMessenger.of(context).showSnackBar(
      //                         const SnackBar(
      //                             content: Text('Registration successful..')),
      //                       );

      Get.to(
        NavigationHome(),
        duration: const Duration(seconds: 1),
        transition: Transition.zoom,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFcbe6f6)),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: FadeAnimation(
                    10,
                    Column(
                      children: [
                        Image.asset('assets/images/logo.png'),
                        const Text(
                          "Welcome to MyHostel+",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
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
                              margin:
                                  const EdgeInsets.only(left: 22, bottom: 20),
                              child: const FadeAnimation(
                                10,
                                Text(
                                  "A free booking Hostel for students",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black87,
                                      letterSpacing: 1.5,
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
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.person),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your full name';
                                            }
                                            return null; // Validation passed
                                          },
                                          keyboardType: TextInputType.text,
                                          controller: userName,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text(" Full Name"),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          FadeAnimation(
                            3,
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
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.email_outlined),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                !value.isEmail) {
                                              return 'Please enter a valid E-mail';
                                            }
                                            return null; // Validation passed
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: userEmail,
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
                            4,
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
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.school_rounded),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your School';
                                            }
                                            return null; // Validation passed
                                          },
                                          keyboardType: TextInputType.text,
                                          controller: userCurrentSchool,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text(" Curent School"),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          FadeAnimation(
                            5,
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
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.password_outlined),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null; // Validation passed
                                          },
                                          obscureText: true,
                                          controller: userPassword,
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
                                8,
                                ElevatedButton(
                                  onPressed: setData,
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
                                        gradient: const LinearGradient(colors: [
                                          Colors.blue,
                                          Colors.white10
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: const FadeAnimation(
                                        2,
                                        Text(
                                          'Register',
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
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
