import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../admin_page/fade_animation.dart';
import '../../utils/constants.dart';
import '../../utils/widgets/agentButton.dart';
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
                  FadeAnimation(
                    2, ReadMoreText(
                      HostelsDescription.samuelHostel,
                      trimLines: 3,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Homestel Area:  $homestelName',
                                      style: AppBlackTextStyle.texth1),
                                  Text('LandLord: $landlordName',
                                      style: AppBlackTextStyle.texth1),
                                  Text('Room Type:  $roomType',
                                      style: AppBlackTextStyle.texth1),
                                  Text('Amount:  $roomAmount each',
                                      style: AppBlackTextStyle.texth1),
                                  Text('Minites Walk:  $homestelMinWalk',
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
                                      String emailBody = '''

Homestel Area: $homestelName
________________________\n
Amount: $roomAmount,
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
                                        ccRecipients: [
                                          'www.akwasititus@gmail.com'
                                        ],
                                        subject:
                                            'New Homstel Booking at $homestelName',
                                        body: emailBody,
                                      );
                                      FlutterMailer.send(mail);
                                    },

                                    /// displaying payment amount
                                    hostelAmount: 'GHS $roomAmount',
                                    colour: Colors.blue,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: FadeAnimation( 5,  AgentButton(buttonName: 'Agent'))),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FadeAnimation(
                    10,  AgentButton(
                      buttonName: 'Call Agent',
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FadeAnimation(15,
                     const AgentButton(
                      buttonName: 'Chat with Agent',
                    ),
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
