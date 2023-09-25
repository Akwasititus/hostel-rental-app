// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Import the Get package
// import 'adminUpload.dart';
// import 'retrievData.dart'; // Assuming you have a file for HostelBookingResult

// class AdminCheckPoint extends StatelessWidget {
//   const AdminCheckPoint({Key? key}) : super(key: key); // Fixed the constructor

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar( // Added an AppBar for a complete Flutter app structure
//         title: Text('Admin Checkpoint'),
//       ),
//       body: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Please Select Your prefered option'),
//             InkWell(
//               onTap: () {
//                 Get.to(() => AdminUpload()); // Use lambda to instantiate the widget
//               },
//               child: SizedBox(
//                 height: 150,
//                 child: Card(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Center(child: Text('Upload a New Hostel')),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             InkWell(
//               onTap: () {
//                 Get.to(() => HostelBookingResult()); // Use lambda to instantiate the widget
//               },
//               child: SizedBox(
//                 height: 150,
//                 child: Card(
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Center(child: Text('View Booked Request')),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'adminUpload.dart';
import 'fade_animation.dart';
import 'retrievData.dart';

class AdminCheckPoint extends StatelessWidget {
  const AdminCheckPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Checkpoint'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Please Select Your Preferred Option',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    letterSpacing: 2,
                    fontFamily: "Lobster"),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(() => AdminUpload());
              },
              child: FadeAnimation(
                2,
                SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('Upload a New Hostel'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(() => HostelBookingResult());
              },
              child: FadeAnimation(
                4,
                SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('View Booked Request'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
