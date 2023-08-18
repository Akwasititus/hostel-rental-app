import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Screens/detailPage.dart';

import '../constants.dart';

class GetHostels extends StatelessWidget {
  final String documentId;

  const GetHostels({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get userCollection

    CollectionReference hostels =
        FirebaseFirestore.instance.collection('addHostel');

    return FutureBuilder<DocumentSnapshot>(
        future: hostels.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            List imageUrls = [
              'assets/images/hostel11.jpg',
              'assets/images/hostel22.jpg',
              'assets/images/hostel33.jpeg',
              'assets/images/hostel44.jpeg',
            ];

            final hostel = imageUrls;

            return GestureDetector(
              onTap: () {
                Get.to( Detail(),
                    arguments: {
                      //-------------------------------------------------
                      // these are argument from the model page that are being passed to the detailed screen
                      //---------------------------------------------------
                      'hostelName': data['hostelName'].toString(),
                      'agentEmail': data['agentEmail'].toString(),
                      'hostelDesc': data['hostelDesc'].toString(),
                      'hostelLocation': data['hostelLocation'].toString(),
                      'imageLink': data['imageLink'],
                      'hostelRooms': imageUrls,
                      'roomType1': data['oneinaRoom'],
                      'roomType2': data['twoInaRoom'],
                      'roomType3': data['threeinaRoom'],
                      'roomType4': data['fourinaRoom'],
                    },
                    duration: const Duration(seconds: 1),
                    transition: Transition.native);
              },
              child: Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFcbe6f6),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GridTile(
                  // header: GridTileBar(
                  //   trailing: Padding(
                  //     padding: const EdgeInsets.only(top: 5),
                  //     child:
                  //     Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //           color: Colors.black54,
                  //           borderRadius:
                  //               BorderRadius.circular(15.0)),
                  //       child:
                  //       IconButton(
                  //         icon: Icon(
                  //             hostel.favIcon
                  //                 ? Icons.favorite
                  //                 : Icons.thumb_up_alt_rounded,
                  //             color: hostel.favIcon
                  //                 ? Colors.red
                  //                 : Colors.white
                  //                 ),
                  //         onPressed: () {
                  //           setState(() {
                  //             hostel.favIcon = !hostel.favIcon;
                  //           });
                  //           /* Add to Favarate */
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(data['hostelName'],
                        style: AppWhiteTextStyle.texth1),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['hostelLocation'],
                            style: AppWhiteTextStyle.texth2),
                        const Text('Rooms Available',
                            style: AppWhiteTextStyle.texth2),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.2),
                        topRight: Radius.circular(20.0)), // Image border
                    child: Image.network(
                      data['imageLink'],
                      height: 20.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );

            
          }
          return const Text('loading...');
        });
  }
}
