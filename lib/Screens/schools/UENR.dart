import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../utils/constants.dart';

import '../../utils/functions/getHostels.dart';
import '../../utils/functions/getResentHostels.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user account/registerUser.dart';

class UENR extends StatefulWidget {
  const UENR({super.key});

  @override
  State<UENR> createState() => _UENRState();
}

class _UENRState extends State<UENR> {
  //-------------------------------------------------------------
  // selecting fav
  //-------------------------------------------------------------
  bool favoriteColor = false;

  //-------------------------------------------------------------
  //  controller for the search
  //-------------------------------------------------------------
  final TextEditingController _searchController = TextEditingController();

  List<String> allHostels = []; // List of all hostels
  List<String> filteredHostels = []; // List of hostels after filtering

  void filterHostels(String query) {
    setState(() {
      filteredHostels = allHostels
          .where((hostelName) =>
              hostelName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

//-------------------------------------------------------------
// dicument IDs
//-------------------------------------------------------------
  List<String> docIDs1 = [];

//-------------------------------------------------------------
// getDocs Ids1
//-------------------------------------------------------------
  /*Future getDocId1() async {
    await FirebaseFirestore.instance
        .collection('addHostel')
        .get()
        .then((snapshot) => snapshot.docs.forEach((docment) {
              docIDs1.add(docment.reference.id);
            }));
  }*/

  Future<List<String>> getDocId1() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('addHostel')
      .get();

  return snapshot.docs.map((docment) => docment.reference.id).toList();
}


//-------------------------------------------------------------
  // dicument IDs2
//-------------------------------------------------------------
  List<String> docIDs2 = [];

  Future<List<String>> getDocId2() async {
    QuerySnapshot snapshot2 =
        await FirebaseFirestore.instance.collection('addResentHostel').get();
    return snapshot2.docs.map((document2) => document2.id).toList();
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  String? obtuserName;
  String? obtuserEmail;
  String? obtuserCurrentSchool;
  String? obtuserPassword;

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    obtuserName = prefs.getString('name');
    obtuserEmail = prefs.getString('email');
    obtuserCurrentSchool = prefs.getString('curentSchool');
    obtuserPassword = prefs.getString('password');

    setState(() {
      // You might have additional UI update logic here
      obtuserName = obtuserName;
      obtuserEmail = obtuserEmail;
      obtuserCurrentSchool = obtuserCurrentSchool;
      obtuserPassword = obtuserPassword;
    });
  }

  void getUserLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('curentSchool');
    await prefs.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------------------
    // media query for checking screen sizes
    //-------------------------------------------------------------
    var deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFcbe6f6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.03,
                vertical: deviceSize.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Yoo! $obtuserName 👋',
                            style: AppBlackTextStyle.textpBlack),
                        const Text('Looking for a Place to Stay?',
                            style: AppBlackTextStyle.texth1),
                      ],
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Nope'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      getUserLogout();
                                      Get.to(
                                        RegisterUser(),
                                        duration: const Duration(seconds: 1),
                                        transition: Transition.zoom,
                                      );
                                    },
                                    child: const Text('Yeah'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Logout')),
                    //Expanded(child: Container()),

                    // Column(
                    //   children: [
                    //     ProfilePicture(
                    //       name: '$obtuserName',
                    //       tooltip: true,
                    //       role: '$obtuserCurrentSchool',
                    //       radius: 20,
                    //       fontsize: 21,
                    //     ),
                    //     GestureDetector(
                    //         onTap: () {
                    //           showDialog(
                    //             context: context,
                    //             builder: (context) {
                    //               return AlertDialog(
                    //                 title: const Text('Logout'),
                    //                 content: const Text(
                    //                     'Are you sure you want to logout?.'),
                    //                 actions: [
                    //                   TextButton(
                    //                     onPressed: () => Navigator.pop(context),
                    //                     child: const Text('Nope'),
                    //                   ),
                    //                   TextButton(
                    //                     onPressed: () {
                    //                       Navigator.pop(context);
                    //                       getUserLogout();
                    //                       Get.to(
                    //                         RegisterUser(),
                    //                         duration:
                    //                             const Duration(seconds: 1),
                    //                         transition: Transition.zoom,
                    //                       );
                    //                     },
                    //                     child: const Text('Yeah'),
                    //                   ),
                    //                 ],
                    //               );
                    //             },
                    //           );
                    //         },
                    //         child: const Text('Logout')),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),

                ///-------------------------------------------------------------
                /// Search view
                ///-------------------------------------------------------------
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextField(
                      controller: _searchController,
                      onChanged:
                          filterHostels, // Call filter method on text change
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              filterHostels(''); // Clear filter
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              /* do search */
                              filterHostels(_searchController.text);
                            },
                          ),
                          hintText: 'Lasvegas Hostle',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                //-------------------------------------------------------------
                // Search view ends here
                //-------------------------------------------------------------
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text('Popular', style: AppBlackTextStyle.texth2),
                    Expanded(child: Container()),
                    Text('more',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            fontFamily: 'Ubuntu-Regular')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                //-------------------------------------------------------------
                // This list view shows a list of pupolar hostels
                //-------------------------------------------------------------
                /*SizedBox(
                  height: 250,
                  child: FutureBuilder(
                      future: getDocId1(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: docIDs1.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: GetHostels(documentId: docIDs1[index]));
                          },
                        );
                      }),
                ),*/

                SizedBox(
                  height: 300,
                  child: FutureBuilder<List<String>>(
                  future: getDocId1(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // Show a loading indicator.
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available. ${snapshot.hasData}'));
                    } else {
                      List<String>? docIDs1 = snapshot.data;
                      return ListView.builder(
                        itemCount: docIDs1!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: GetHostels(documentId: docIDs1[index]),
                          );
                        },
                      );
                    }
                  },
                ),
                ),

                const SizedBox(height: 15),
                const Text('Resent Hostels', style: AppBlackTextStyle.texth2),
                //-------------------------------------------------------------
                // this is a list view that shows a list of the resent hostels
                //-------------------------------------------------------------
                SizedBox(
                  height: 300,
                  child: FutureBuilder<List<String>>(
                    future: getDocId2(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<String> docIDs2 = snapshot.data ?? [];
                        return SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: docIDs2.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: GetResentHostels(
                                    documentId2: docIDs2[index]),
                              );
                            },
                          ),
                        );
                      }

                      return Shimmer(
                        child: Container(
                          color: Colors.deepPurple,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
