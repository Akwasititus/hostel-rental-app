import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../utils/constants.dart';
import '../utils/widgets/buttons.dart';
import 'booking/booking.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    // recieving the argument from the previeous page
    //---------------------------------------------------
    final hostelsArguments = Get.arguments;

    final hostelName = hostelsArguments['hostelName'];
    final hostelLocation = hostelsArguments['hostelLocation'];
    final imageLink = hostelsArguments['imageLink'];
    final hostelDesc = hostelsArguments['hostelDesc'];
    final hostelEmail = hostelsArguments['hostelEmail'];

    final hostelRooms = hostelsArguments['hostelRooms'];

    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-------------------------------------------------
            // Displaying the hostel name on the appbar with the location
            //---------------------------------------------------
            Text(hostelName, style: AppWhiteTextStyle.texth1),
            Text(hostelLocation, style: AppWhiteTextStyle.texth2),
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
                //-------------------------------------------------
                // showing the image of the seleted hostel in full from the previous page
                //---------------------------------------------------
                child: Image.network(imageLink)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Details', style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),
                  //-------------------------------------------------
                  // showing a brief discription on selected hostel
                  //---------------------------------------------------
                  ReadMoreText(
                    hostelDesc,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'read more',
                    trimExpandedText: '...Show less',
                    lessStyle: const TextStyle(fontWeight: FontWeight.bold),
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    style: AppBlackTextStyle.texth3,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text('Please Select your prefered Room type',
                      style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),

                  //-------------------------------------------------
                  // this is a grid view showing the rooms in the selected hostel
                  //---------------------------------------------------
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: hostelRooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      final imageUrls = hostelRooms[index];

                      // a simple list of prices
                      final prices = [4000, 3500, 2000, 1500];

                      return GestureDetector(
                          onTap: () {
                            //-------------------------------------------------
                            // a dialog that shows a list of details for the selected room
                            //---------------------------------------------------
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Room Details'),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Hostel Name: $hostelName',
                                          style: AppBlackTextStyle.texth1),
                                      Text('Amouunt: GHS ${prices[index]}',
                                          style: AppBlackTextStyle.texth1),
                                      Text(
                                          'Number of persons in a Room: ${index + 1}',
                                          style: AppBlackTextStyle.texth1),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Buttons(
                                        btnName: 'Cancel',
                                        clickMe: () {
                                          Navigator.pop(context);
                                        },
                                        hostelAmount: 'GHS ${prices[index]}',
                                        colour: Colors.grey.shade400,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Buttons(
                                        btnName: 'Book',
                                        clickMe: () {
                                          Get.to(() => HostelBooking(),
                                              arguments: {
                                                //-------------------------------------------------
                                                // a simple argument for sending data strieght to the email
                                                //---------------------------------------------------
                                                'hostelName': hostelName,
                                                'hostelEmail': hostelEmail,
                                                'hostelAmount': prices[index],
                                                'personsInRoom': index + 1,
                                              });
                                        },
                                        hostelAmount: 'GHS ${prices[index]}',
                                        colour: Colors.blue,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(imageUrls),
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
                                    'GHS ${prices[index]}',
                                    style: const TextStyle(
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
                          ));
                      //   ),
                      // );
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
