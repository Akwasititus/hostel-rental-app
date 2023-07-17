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
            Text(hostelsArguments['hostelsName'],
                style: AppWhiteTextStyle.texth1),
            Text(hostelsArguments['hostelLocation'],
                style: AppWhiteTextStyle.texth2),
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
                child: Image.asset(hostelsArguments['imgURL'])),
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
                    hostelsArguments['hostelsDesc'],
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
                  const Text('Please Select your prefered Room type',
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
                    itemCount: hostelsArguments['hostelRooms'].length,
                    itemBuilder: (BuildContext context, int index) {
                      final imageUrl = hostelsArguments['hostelRooms'][index];

                      // a simple list of prices
                      final prices = [4000, 3500, 3000, 2500];

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
                                      Text(
                                          'Hostel Name: ${hostelsArguments['hostelsName']}',
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
                                          Get.to(() => const HostelBooking(),
                                              arguments: {
                                                //-------------------------------------------------
                                                // a simple argument for sending data strieght to the email
                                                //---------------------------------------------------
                                                'hostelName': hostelsArguments[
                                                    'hostelsName'],
                                                'hostelsEmail':
                                                    hostelsArguments[
                                                        'hostelsEmail'],
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
