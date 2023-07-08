import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

import 'package:get/get.dart';

import '../../admin_page/fade_animation.dart';
import '../../utils/widgets/textFields.dart';

class HostelBooking extends StatefulWidget {
  const HostelBooking({Key? key}) : super(key: key);

  @override
  _HostelBookingState createState() => _HostelBookingState();
}

class _HostelBookingState extends State<HostelBooking> {
  //-------------------------------------------------
  // a simple text editing editing controllers
  //---------------------------------------------------
  final _nameController = TextEditingController();
  final _homeaddressController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _commentController = TextEditingController();


  //-------------------------------------------------
  // variable decleartion for holding the values from the text editing controllers
  //---------------------------------------------------
  String _name = '';
  String _address = '';
  String _contact = '';
  String _comment = '';

  //-------------------------------------------------
  // dispose()
  //---------------------------------------------------
  @override
  void dispose() {
    _nameController.dispose();
    _commentController.dispose();
    _homeaddressController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------
    // receiving argument that was passed from the 'uenr.dart' page
    //---------------------------------------------------
    final arguments = Get.arguments;

    final String hostelName = arguments['hostelName'];
    final int hostelAmount = arguments['hostelAmount'];
    final int personsInRoom = arguments['personsInRoom'];
    final String hostelsEmail = arguments['hostelsEmail'];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade600,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: FadeAnimation(
                2,
                Column(
                  children: const [
                    Text(
                      "Your Responce will be sent to the Hostel Managers for verification",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 5,
                        color: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "if your selected room is available, you will be notified by mail/sms with a payment link to make payment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 5,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                margin: const EdgeInsets.only(top: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 22, bottom: 20),
                        child: const FadeAnimation(
                          2,
                          Center(
                            child: Text(
                              "Please Upload the right information",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black87,
                                letterSpacing: 2,
                                fontFamily: "Lobster",
                              ),
                            ),
                          ),
                        ),
                      ),
                      //-------------------------------------------------
                      // Name text field
                      //---------------------------------------------------
                      MyTextField(
                        height: 70,
                        hintext: 'Name',
                        iconData: Icons.home,
                        controller: _nameController,
                      ),
                      //-------------------------------------------------
                      // Adress text field
                      //---------------------------------------------------
                      MyTextField(
                        hintext: 'Home Address',
                        iconData: Icons.home,
                        controller: _homeaddressController, height: 70,
                      ),
                      //-------------------------------------------------
                      // contact text field
                      //---------------------------------------------------
                      MyTextField(
                        hintext: 'Contact Number',
                        iconData: Icons.contact_emergency,
                        controller: _contactNumberController, height: 70,
                      ),
                      //-------------------------------------------------
                      // comment text field
                      //---------------------------------------------------

                      MyTextField(
                        hintext: 'comment',
                        iconData: Icons.comment,
                        controller: _commentController, height: 130,
                      ),
                      // FadeAnimation(
                      //   2,
                      //   Container(
                      //     width: double.infinity,
                      //     height: 130,
                      //     margin: const EdgeInsets.symmetric(
                      //       horizontal: 20,
                      //       vertical: 20,
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 15,
                      //       vertical: 5,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: Colors.purpleAccent,
                      //         width: 1,
                      //       ),
                      //       boxShadow: const [
                      //         BoxShadow(
                      //           color: Colors.purpleAccent,
                      //           blurRadius: 10,
                      //           offset: Offset(1, 1),
                      //         ),
                      //       ],
                      //       color: Colors.white,
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(20),
                      //       ),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         Expanded(
                      //           child: Container(
                      //             margin: const EdgeInsets.only(left: 10),
                      //             child: TextFormField(
                      //               minLines: 6,
                      //               maxLines: null,
                      //               keyboardType: TextInputType.multiline,
                      //               decoration: const InputDecoration(
                      //                 alignLabelWithHint: true,
                      //                 border: InputBorder.none,
                      //                 label: Text('comment'),
                      //               ),
                      //               controller: _commentController,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      FadeAnimation(
                        2,
                        ElevatedButton(
                          onPressed: () {
                            _name = _nameController.text;
                            _address = _homeaddressController.text;
                            _contact = _contactNumberController.text;
                            _comment = _commentController.text;
                            //-------------------------------------------------
                            // this has the users selection and the users details to be displayed on the email
                            //---------------------------------------------------
                            String emailBody =
                                 '''
USERS SELECTIONS
------------------------\n
Hostel Name: $hostelName
________________________\n
Amount: GHS $hostelAmount
_________________________
Number of persons in a Room: $personsInRoom
________________________\n\n

USER DETAILS
------------------------\n
Name: $_name
________________________\n
Address: $_address
________________________\n
Contact: $_contact
________________________\n
Comment: $_comment
________________________\n
    ''';

                            var mail = MailOptions(
                              //-------------------------------------------------
                              // here's the hostel managers email address
                              //---------------------------------------------------
                              recipients: [hostelsEmail],
                              ccRecipients: ['www.akwasititus@gmail.com'],
                              subject: 'New Hostel Booking from $_name',
                              body: emailBody,
                            );
                            FlutterMailer.send(mail);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.purpleAccent,
                            shadowColor: Colors.purpleAccent,
                            elevation: 18,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.purpleAccent,
                                  Colors.deepPurpleAccent,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              width: 201,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
