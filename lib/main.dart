import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MotherPage/mother_page.dart';
import 'package:device_preview/device_preview.dart';

import 'Screens/user account/registerUser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 runApp(DevicePreview(
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'myHostel+',
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckingPoint(),
    );
  }
}

class CheckingPoint extends StatefulWidget {
  const CheckingPoint({super.key});

  @override
  State<CheckingPoint> createState() => _CheckingPointState();
}

class _CheckingPointState extends State<CheckingPoint> {
  String? finalEmail;

  Future<void> isRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var getEmail = prefs.getString('email');

    setState(() {
      finalEmail = getEmail;
    });
  }

  @override
  void initState() {
    super.initState();
    isRegistered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: isRegistered(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(child: const CircularProgressIndicator());
          }
          return finalEmail == null
              ? const RegisterUser()
              : const NavigationHome();
        },
      ),
    );
  }
}
