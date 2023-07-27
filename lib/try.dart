// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class YourScreen extends StatelessWidget {
//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection('your_collection_name');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App'),
//       ),
//       body: SizedBox(
//         height: 300,
//         child: GestureDetector(
//           onTap: () {
//             Get.to(
//               const Detail(),
//               arguments: {
//                 // Arguments for the detail screen, if needed.
//               },
//               duration: const Duration(seconds: 1),
//               transition: Transition.native,
//             );
//           },
//           child: StreamBuilder(
//             stream: _collectionReference.snapshots(),
//             builder: (BuildContext context,
//                 AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//               if (streamSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (streamSnapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${streamSnapshot.error}'),
//                 );
//               } else if (streamSnapshot.connectionState ==
//                   ConnectionState.done) {
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: streamSnapshot.data?.docs.reversed.length,
//                     itemBuilder: (context, index) {
//                       final DocumentSnapshot documentSnapshot =
//                           streamSnapshot.data!.docs[index];

//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 100,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey.shade100,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 12.0),
//                             child: ListTile(
//                               title: Text(
//                                 documentSnapshot['rHostelName'],
//                                 style: AppBlackTextStyle.texth1,
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 10),
//                                   Text(
//                                     documentSnapshot['rHostelLocation'],
//                                     style: AppBlackTextStyle.texth2,
//                                   ),
//                                 ],
//                               ),
//                               leading: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.asset(
//                                   documentSnapshot['rHostelImageLink'],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               } else {
//                 // This should not be reached, but just in case, return a fallback widget
//                 return const Text('loading...');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Define your AppBlackTextStyle and Detail widget if not already defined.
