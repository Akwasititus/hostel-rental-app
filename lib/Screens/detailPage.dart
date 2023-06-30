

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../Models/hostelCardModel.dart';
import '../utils/constants.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hostelsArguments = Get.arguments;

    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hostelsArguments['hostelsName'],style: AppWhiteTextStyle.texth1),
            Text(hostelsArguments['hostelLocation'],style: AppWhiteTextStyle.texth2),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
              child: Image.asset(hostelsArguments['imgURL'])),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Details',  style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    hostelsArguments['hostelsDesc'],
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'read more',
                    trimExpandedText: '...Show less',
                    lessStyle: const TextStyle(fontWeight: FontWeight.bold),
                       moreStyle:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    style: AppBlackTextStyle.texth3,textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text('Rooms Available at ${hostelsArguments['hostelsName']}', style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: hostelsArguments['hostelRooms'].length,
                    itemBuilder: (BuildContext context, int index) {
                      var am = 3200 + index + 10; 
                      final imageUrl = hostelsArguments['hostelRooms'][index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text(
                                'GHS 2300',                                
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              Text(
                                '${index + 1} in a Room',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_profile_picture/flutter_profile_picture.dart';
// import 'package:get/get.dart';
// import 'package:readmore/readmore.dart';
// import '../Models/hostelCardModel.dart';
// import '../utils/constants.dart';
// import '../utils/widgets/buttons.dart';

// class Detail extends StatefulWidget {
//   const Detail({
//     super.key,
//   });

//   @override
//   State<Detail> createState() => _DetailState();
// }


// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     var deviceSize = MediaQuery.of(context).size;
//     final hostelsArguments = Get.arguments;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFcbe6f6),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 300,
//                 child: GridTile(
//                   header: GridTileBar(
//                     leading: Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFcbe6f6),
//                           borderRadius: BorderRadius.circular(15.0)),
//                       child: IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           Get.back();
//                         },
//                       ),
//                     ),
//                   ),
//                   footer: GridTileBar(
//                     backgroundColor: Colors.black54,
//                     title: Text(hostelsArguments['hostelsName'],
//                         style: AppWhiteTextStyle.texth1),
//                     subtitle: Text(hostelsArguments['hostelLocation'],
//                         style: AppWhiteTextStyle.texth2),
//                     trailing: OutlinedButton(
//                       onPressed: () {
//                         showMyDialog();
//                       },
//                       style: OutlinedButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           fixedSize: const Size(150, 50),
//                           backgroundColor: const Color(0xFFcbe6f6),
//                           textStyle: const TextStyle(fontSize: 17)),
//                       child: const Text('Make Payment',
//                           style: AppBlackTextStyle.texth1),
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(10.0),
//                         topRight: Radius.circular(10.0)),
//                     child: Image.asset(
//                       hostelsArguments['imgURL'],
//                       height: 200.5,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: deviceSize.width * 0.05,
//                     vertical: deviceSize.height * 0.03),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Details', style: AppBlackTextStyle.texth1),
//                     const SizedBox(
//                       height: 5.0,
//                     ),
//                      ReadMoreText(
//                       hostelsArguments['hostelsDesc'],
//                       trimLines: 2,
//                       colorClickableText: Colors.pink,
//                       trimMode: TrimMode.Line,
//                       trimCollapsedText: 'read more',
//                       trimExpandedText: '...Show less',
//                       style: AppBlackTextStyle.texth3,
//                       lessStyle: const TextStyle(fontWeight: FontWeight.bold),
//                       moreStyle:
//                           const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),

//                     const SizedBox(
//                       height: 10.0,
//                     ),

//                     Row(
//                       children: [
//                         const ProfilePicture(
//                           name: 'Titus Akwasi ',
//                           tooltip: true,
//                           radius: 25,
//                           role: 'Hostel Manager',
//                           fontsize: 21,
//                         ),
//                         const SizedBox(
//                           width: 10.0,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text('TITUS Akwasi',
//                                 style: AppBlackTextStyle.texth2),
//                             const SizedBox(
//                               height: 3.0,
//                             ),
//                             Row(
//                               children: [
//                                 const Text('Hostel Manager@ ',
//                                     style: AppBlackTextStyle.texth4),
//                                 Text(hostelsArguments['hostelsName'],
//                                     style: AppBlackTextStyle.texth4)
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),

//                     const SizedBox(
//                       height: 15,
//                     ),

//                      Text('Rooms Available at ${hostelsArguments['hostelsName']}', style: AppBlackTextStyle.texth1),
//                     const SizedBox(
//                       height: 5,
//                     ),

//                     // hostel homes

//                     SizedBox(
//                         height: 300,
//                         child: GridView.builder(
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//   ),
//   itemCount: hostelsArguments['hostelRooms'].length, // Update the itemCount
//   itemBuilder: (BuildContext context, int index) {
//     final hostel_rooms = hostelsArguments['hostelRooms'][index]; // Access the hostelRooms list using the index

//     return GestureDetector(
//       child: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(3.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       hostel_rooms, // Use the hostel_rooms variable
//                       fit: BoxFit.cover,
//                       height: 150,
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Container(
//                           height: 40,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(9.0),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'hostelsArguments',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   },
// )
//                         )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showMyDialog() {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Please Choose an Option'),
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Buttons(
//               btnName: 'One in a Room',
//               clickMe: () {},
//               hostelAmount: '\$1,200',
//             ),
//             Buttons(
//               btnName: 'Two in a Room',
//               clickMe: () {},
//               hostelAmount: '\$2,700',
//             ),
//             Buttons(
//               btnName: 'Three in a Room',
//               clickMe: () {},
//               hostelAmount: '\$9,200',
//             ),
//             Buttons(
//               btnName: 'Four in a Room',
//               clickMe: () {},
//               hostelAmount: '\$4,300',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
