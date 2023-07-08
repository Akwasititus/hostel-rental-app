import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../utils/constants.dart';
import '../../utils/widgets/buttons.dart';

class HomestelHouseDesc extends StatelessWidget {
  const HomestelHouseDesc({super.key});

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    // recieving the argument from the previeous page
    //---------------------------------------------------
    final homestelHouseDescs = Get.arguments;

    final roomImg = homestelHouseDescs['roomImg'];
    final homestelName = homestelHouseDescs['homestelName'];
    final landlordName = homestelHouseDescs['landlordName'];
    final roomType = homestelHouseDescs['roomType'];
    final roomAmount = homestelHouseDescs['roomAmount'];
    final homestelMinWalk = homestelHouseDescs['homestelMinWalk'];

    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       //-------------------------------------------------
      //       // Displaying the hostel name on the appbar with the location
      //       //---------------------------------------------------
      //       Text(hostelsArguments['hostelsName'],
      //           style: AppWhiteTextStyle.texth1),
      //       Text(hostelsArguments['hostelLocation'],
      //           style: AppWhiteTextStyle.texth2),
      //     ],
      //   ),
      // ),
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
                child: Image.asset(roomImg)),
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
                    HostelsDescription.samuelHostel,
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
                  GestureDetector(
                    onTap: () {
                            //-------------------------------------------------
                            // a dialog that shows a list of details for the selected room
                            //---------------------------------------------------
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Room Selection'),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                     Text(
                                          'HomestelArea:  $homestelName',
                                          style: AppBlackTextStyle.texth1),
                                      Text(
                                          'LandLord: $landlordName',
                                          style: AppBlackTextStyle.texth1),
                                      Text(
                                          'Room Type:  $roomType',
                                          style: AppBlackTextStyle.texth1),
                                      Text('Amouunt:  $roomAmount',
                                          style: AppBlackTextStyle.texth1),
                                      Text(
                                          'Minites Walk:  $homestelMinWalk',
                                          style: AppBlackTextStyle.texth1),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Buttons(
                                        btnName: 'Cancel',
                                        clickMe: () {
                                          Navigator.pop(context);
                                        },
                                        hostelAmount: 'GHS $roomAmount',
                                        colour: Colors.grey.shade400,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Buttons(
                                        btnName: 'Agent',
                                        clickMe: () {
                                          
                                             
                            
                            //-------------------------------------------------
                            // this has the users selection and the users details to be displayed on the email
                            //---------------------------------------------------
                            String emailBody =
                                 '''

HomestelArea: $homestelName
________________________\n
Amouunt: GHS $roomAmount,
_________________________
LandLord: $landlordName
________________________\n\n

Room Type: $roomType,
________________________\n
Minites Walk: $homestelMinWalk
________________________\n
    ''';

                            var mail = MailOptions(
                              //-------------------------------------------------
                              // here's the hostel managers email address
                              //---------------------------------------------------
                              recipients: ['iakwasititus@gmail.com'],
                              ccRecipients: ['www.akwasititus@gmail.com'],
                              subject: 'New Hostel Booking from',
                              body: emailBody,
                            );
                            FlutterMailer.send(mail);
                          
                                          
                                           
                                              
                                        },
                                        hostelAmount: 'GHS $roomAmount',
                                        colour: Colors.blue,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0))),
                      child:  const Center(child: Text('Contact Agent', style: AppWhiteTextStyle.texth1)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
