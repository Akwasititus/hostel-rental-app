import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../utils/constants.dart';
import '../utils/widgets/buttons.dart';
import 'booking/booking.dart';
import 'other screens/youtube.dart';

class Detail extends StatelessWidget {
  Detail({super.key});

  String? youTubeID;

  @override
  Widget build(BuildContext context) {
    final hostelsArguments = Get.arguments;

    final hostelName = hostelsArguments['hostelName'];
    final hostelLocation = hostelsArguments['hostelLocation'];
    final imageLink = hostelsArguments['imageLink'];
    final hostelDesc = hostelsArguments['hostelDesc'];
    final agentEmail = hostelsArguments['agentEmail'];

    final roomType1 = hostelsArguments['roomType1'];
    final roomType2 = hostelsArguments['roomType2'];
    final roomType3 = hostelsArguments['roomType3'];
    final roomType4 = hostelsArguments['roomType4'];

    final hostelRooms = hostelsArguments['hostelRooms'];

    // const String url = 'https://paystack.com/pay/bm7osxhi7t';

    // Future<void> launchURL() async {
    //   if (!await launch(url,forceSafariVC: false, forceWebView: false)) {
    //     throw Exception('Could not launch');
    //   }
    // }

    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                bottomRight: Radius.circular(20.0),
              ),
              child: Image.network(imageLink),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Details', style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  const Text('Hostel video', style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 5),
                  YouTubePlayerScreen(
                    videoId: youTubeID != null ? 'G1M9NK7C' : 'G1M9NK7CW64',
                  ),
                  const SizedBox(height: 20),
                  const Text('Please Select your preferred Room type',
                      style: AppBlackTextStyle.texth1),
                  const SizedBox(height: 10),
                  GridView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: hostelRooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      final imageUrls = hostelRooms[index];
                      final prices = [
                        roomType1,
                        roomType2,
                        roomType3,
                        roomType4
                      ];
                      final isAvailable = prices[index] != null;

                      return GestureDetector(
                        onTap: () {
                          if (isAvailable) {
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
                                      Text('Amount: GHS ${prices[index]}',
                                          style: AppBlackTextStyle.texth1),
                                      Text(
                                          'Number of persons in a Room: ${index + 1}',
                                          style: AppBlackTextStyle.texth1),
                                      const SizedBox(height: 10.0),
                                      Buttons(
                                        btnName: 'Cancel',
                                        clickMe: () {
                                          Navigator.pop(context);
                                        },
                                        hostelAmount: 'GHS ${prices[index]}',
                                        colour: Colors.grey.shade400,
                                      ),
                                      const SizedBox(height: 10.0),
                                      Buttons(
                                        btnName: 'Book',
                                        clickMe: () {
                                          Navigator.pop(context);
                                          Get.to(() => HostelBooking(),
                                              arguments: {
                                                'hostelName': hostelName,
                                                'agentEmail': agentEmail,
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
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Room Not Available'),
                                  content: const Text(
                                      'The selected room is not available for this hostel.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
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
                                  isAvailable
                                      ? 'GHS ${prices[index]}'
                                      : 'Room not Available',
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
