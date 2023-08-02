import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import '../../Models/hostelCardModel.dart';
import '../../utils/constants.dart';

import '../../utils/functions/getHostels.dart';
import '../../utils/functions/getResentHostels.dart';
import '../detailPage.dart';

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
  final TextFieldController = TextEditingController();

  

//-------------------------------------------------------------
// dicument IDs
//-------------------------------------------------------------  
  List<String> docIDs1 = [];


//-------------------------------------------------------------
// getDocs Ids1
//-------------------------------------------------------------  
  Future getDocId1() async {
    await FirebaseFirestore.instance
        .collection('addHostel')
        .get()
        .then((snapshot) => snapshot.docs.forEach((docment) {
              docIDs1.add(docment.reference.id);
            }));
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
                      children: const [
                        Text('Welcome Suleman 👋',
                            style: AppBlackTextStyle.textpBlack),
                        Text('Looking for a Place to Stay?',
                            style: AppBlackTextStyle.texth1),
                      ],
                    ),
                    Expanded(child: Container()),
                    const ProfilePicture(
                      name: 'Johnson Suleman',
                      tooltip: true,
                      role: 'Student',
                      radius: 20,
                      fontsize: 21,
                    ),
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
                      controller: TextFieldController,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              TextFieldController.clear();
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              /* do search */
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
                FutureBuilder(
                    future: getDocId1(),
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: docIDs1.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child:
                                 GetHostels(
                                     documentId: docIDs1[index]));
                          },
                        ),
                      );
                    }),
                const SizedBox(height: 15),
                const Text('Resent', style: AppBlackTextStyle.texth2),
                //-------------------------------------------------------------
                // this is a list view that shows a list of the resent hostels
                //-------------------------------------------------------------
                SizedBox(
                  height: 300,
                  child:
                      FutureBuilder<List<String>>(
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
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      const Detail(),
                                      arguments: {
                                        // ...
                                      },
                                      duration: const Duration(seconds: 1),
                                      transition: Transition.native,
                                    );
                                  },
                                  child: GetResentHostels(
                                      documentId2: docIDs2[index]),
                                ),
                              );
                            },
                          ),
                        );
                      }

                      return const Text('Loading...');
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




// StreamBuilder(
//                                 stream: _collectionReference.snapshots(),
//                                 builder: ((BuildContext context,
//                                     AsyncSnapshot<QuerySnapshot>
//                                         streamSnapshot) {
//                                   return SizedBox(
//                                     height: MediaQuery.of(context).size.height,
//                                     child: ListView.builder(
//                                         itemCount: streamSnapshot
//                                             .data!.docs.reversed.length,
//                                         itemBuilder: (context, index) {
//                                           final DocumentSnapshot
//                                               documentSnapshot =
//                                               streamSnapshot.data!.docs[index];

//                                           return Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Container(
//                                               height: 100,
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10.0),
//                                                 color: Colors.grey.shade100,
//                                               ),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 12.0),
//                                                 child: ListTile(
//                                                   title: Text(
//                                                       documentSnapshot[
//                                                           'rHostelName'],
//                                                       style: AppBlackTextStyle
//                                                           .texth1),
//                                                   subtitle: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       const SizedBox(
//                                                           height: 10),
//                                                       Text(
//                                                           documentSnapshot[
//                                                               'rHostelLocation'],
//                                                           style:
//                                                               AppBlackTextStyle
//                                                                   .texth2),

//                                                       // Text(hostel1.numberOfRoomsAvailable,
//                                                       //     style: AppBlackTextStyle.texth2),
//                                                     ],
//                                                   ),
//                                                   leading: ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     child: Image.asset(
//                                                       documentSnapshot[
//                                                           'rHostelImageLink'],
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                   // trailing: Container(
//                                                   //   height: 40,
//                                                   //   width: 40,
//                                                   //   decoration: BoxDecoration(
//                                                   //       color: const Color(0xFFcbe6f6),
//                                                   //       borderRadius:
//                                                   //           BorderRadius.circular(15.0)),
//                                                   //   child: IconButton(
//                                                   //     icon: Icon(
//                                                   //         hostel1.favIcon
//                                                   //             ? Icons.favorite
//                                                   //             : Icons.thumb_up_alt_rounded,
//                                                   //         color: hostel1.favIcon
//                                                   //             ? Colors.red
//                                                   //             : Colors.white),
//                                                   //     onPressed: () {
//                                                   //       setState(() {
//                                                   //         hostel1.favIcon = !hostel1.favIcon;
//                                                   //       });
//                                                   //       /* Add to Favarate */
//                                                   //     },
//                                                   //   ),
//                                                   // ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }),
//                                   );
//                                 })
//                                 )