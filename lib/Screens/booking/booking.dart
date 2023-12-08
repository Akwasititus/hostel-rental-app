import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

import 'package:get/get.dart';

import '../../admin_page/fade_animation.dart';
import '../../utils/widgets/textFields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HostelBooking extends StatefulWidget {
  @override
  _HostelBookingState createState() => _HostelBookingState();
}

class _HostelBookingState extends State<HostelBooking> {



  //-----------------------------------------------
  // uploading data to firebase
  //-----------------------------------------------

  Future<void> uploadDataToFirebase(String hostelName, int hostelAmount, int personsInRoom, String agentEmail, String name, String address, String contact, String comment) async {
  try {
    await FirebaseFirestore.instance.collection('hostelBookings').add({
      'hostelName': hostelName,
      'hostelAmount': hostelAmount,
      'personsInRoom': personsInRoom,
      'agentEmail': agentEmail,
      'name': name,
      'address': address,
      'contact': contact,
      'comment': comment,
    });
  } catch (e) {
    print('Error uploading data to Firebase: $e');
  }
}

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
    final String agentEmail = arguments['agentEmail'];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFcbe6f6),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: 
                Column(
                  children: const [
                    Text(
                      "Your response will be sent to an agent for validation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 5,
                        color: Colors.redAccent,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "A payment link will be sent to your email or phone if your selected room is available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 5,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
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
                          child: const Text(
                            "We cannot process your request if the information is incorrect",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                              letterSpacing: 2,
                              fontFamily: "Lobster",
                            ),
                          ),
                        ),
                      
                      //-------------------------------------------------
                      // Name text field
                      //---------------------------------------------------
                      MyTextField(
                        height: 70,
                        hintext: 'Name',
                        iconData: Icons.person_2_outlined,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                      ),
                      //-------------------------------------------------
                      // Adress text field
                      //---------------------------------------------------
                      MyTextField(
                        hintext: 'Home Address',
                        iconData: Icons.home,
                        keyboardType: TextInputType.text,
                        controller: _homeaddressController,
                        height: 70,
                      ),
                      //-------------------------------------------------
                      // contact text field
                      //---------------------------------------------------
                      MyTextField(
                        hintext: 'Contact Number',
                        iconData: Icons.contact_emergency,
                        controller: _contactNumberController,
                        height: 70,
                        keyboardType: TextInputType.phone,
                      ),
                      //-------------------------------------------------
                      // comment text field
                      //---------------------------------------------------

                      
                        Container(
                          width: double.infinity,
                          height: 130,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10,
                                offset: Offset(1, 1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    minLines: 6,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      alignLabelWithHint: true,
                                      border: InputBorder.none,
                                      label: Text('comment'),
                                    ),
                                    controller: _commentController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                      const SizedBox(height: 10),
                      
                        ElevatedButton(
                          onPressed: () {
                            _name = _nameController.text;
                            _address = _homeaddressController.text;
                            _contact = _contactNumberController.text;
                            _comment = _commentController.text;

                            uploadDataToFirebase(hostelName, hostelAmount, personsInRoom, agentEmail, _name, _address, _contact, _comment);
                            //-------------------------------------------------
                            // this has the users selection and the users details to be displayed on the email
                            //---------------------------------------------------
                            String emailBody = '''
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
                              // here's the hostel managers email address "hostelEmail"
                              //---------------------------------------------------
                              recipients: [
                                agentEmail,
                                'iakwasititus@gmail.com'
                              ],
                              ccRecipients: ['www.akwasititus@gmail.com'],
                              subject: 'New Hostel Booking from $_name',
                              body: emailBody,
                            );
                            FlutterMailer.send(mail);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFFcbe6f6),
                            shadowColor: Colors.blue,
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
                                  Color(0xFFcbe6f6),
                                  Colors.blue,
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
