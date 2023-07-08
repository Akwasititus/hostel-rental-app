import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/home.dart';
import '../admin_page/AdminLoginPage.dart';
import 'homestelsHouse/homestels.dart';



class NavigationHome extends StatefulWidget {
  const NavigationHome({Key? key}) : super(key: key);

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  int currentIndex = 0;
  List<Widget> screens = [
    const MyHome(),
    const Homestels(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          iconSize: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'Hostels',
            ),
            BottomNavigationBarItem(
              //icon: ImageIcon(AssetImage("images/referral.png")),
              icon: Icon(Icons.house_rounded),
              label: 'Homestels',
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Get.to(const AdminLogin(),duration: Duration(seconds: 1),transition: Transition.native);
        }),
    );
  }
}