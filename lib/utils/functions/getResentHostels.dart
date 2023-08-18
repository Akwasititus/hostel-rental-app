import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Screens/detailPage.dart';
import '../constants.dart';






class GetResentHostels extends StatelessWidget {
  final String documentId2;

  const GetResentHostels({super.key, required this.documentId2});

  @override
  Widget build(BuildContext context) {
    CollectionReference rhostels =
        FirebaseFirestore.instance.collection('addResentHostel');

    return FutureBuilder<DocumentSnapshot>(
      future: rhostels.doc(documentId2).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> rdata =
              snapshot.data!.data() as Map<String, dynamic>;

              List imageUrls = [
              'assets/images/hostel11.jpg',
              'assets/images/hostel22.jpg',
              'assets/images/hostel33.jpeg',
              'assets/images/hostel44.jpeg',
            ];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListTile(
                  onTap: () {
                    Get.to( Detail(),
                    arguments: {
                      //-------------------------------------------------
                      // these are argument from the model page that are being passed to the detailed screen
                      //---------------------------------------------------
                      'hostelName': rdata['rHostelName'].toString(),
                      'agentEmail': rdata['rHostelEmail'].toString(),
                      'hostelDesc': rdata['rHostelDesc'].toString(),
                      'hostelLocation': rdata['rHostelLocation'].toString(),
                      'imageLink': rdata['rHostelImageLink'],
                      'hostelRooms': imageUrls,
                      'roomType1': rdata['oneinaRoom'],
                      'roomType2': rdata['twoInaRoom'],
                      'roomType3': rdata['threeinaRoom'],
                      'roomType4': rdata['fourinaRoom'],
                    },
                    duration: const Duration(seconds: 1),
                    transition: Transition.native);
                  },
                  title: Text(rdata['rHostelName'], style: AppBlackTextStyle.texth1),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text('Loc:   ' + rdata['rHostelLocation'], style: AppBlackTextStyle.texth2),
                      const SizedBox(height: 10),
                      const Text('Roomes Available for both Males and Female', style: AppBlackTextStyle.texth2),
                    ],
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      rdata['rHostelImageLink'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return const Text('Loading...');
      },
    );
  }
}












// class GetResentHostels extends StatelessWidget {
//   final String documentId2;

//   const GetResentHostels({super.key, required this.documentId2});

//   @override
//   Widget build(BuildContext context) {

//      CollectionReference rhostels =
//         FirebaseFirestore.instance.collection('addResentHostel');
    

//     return FutureBuilder<DocumentSnapshot>(
//       future: rhostels.doc(documentId2).get(),
//        builder: (context, snapshot){
//         if (snapshot.connectionState == ConnectionState.done) {

//           Map<String, dynamic> rdata =
//                 snapshot.data!.data() as Map<String, dynamic>;

//           Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 100,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             color: Colors.grey.shade100,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 12.0),
//             child: ListTile(
//               title:  Text(rdata['rHostelName'], style: AppBlackTextStyle.texth1),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:  [
//                   const SizedBox(height: 10),
//                   Text(rdata['rHostelLocation'], style: AppBlackTextStyle.texth2),
    
//                   // Text(hostel1.numberOfRoomsAvailable,
//                   //     style: AppBlackTextStyle.texth2),
//                 ],
//               ),
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(5),
//                 child: Image.network(
//                   rdata['rHostelImageLink'],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               // trailing: Container(
//               //   height: 40,
//               //   width: 40,
//               //   decoration: BoxDecoration(
//               //       color: const Color(0xFFcbe6f6),
//               //       borderRadius:
//               //           BorderRadius.circular(15.0)),
//               //   child: IconButton(
//               //     icon: Icon(
//               //         hostel1.favIcon
//               //             ? Icons.favorite
//               //             : Icons.thumb_up_alt_rounded,
//               //         color: hostel1.favIcon
//               //             ? Colors.red
//               //             : Colors.white),
//               //     onPressed: () {
//               //       setState(() {
//               //         hostel1.favIcon = !hostel1.favIcon;
//               //       });
//               //       /* Add to Favarate */
//               //     },
//               //   ),
//               // ),
//             ),
//           ),
//         ),
//       );


//         }

//        return const Text('Loadingg...');
//         });

    
//   }
// }
