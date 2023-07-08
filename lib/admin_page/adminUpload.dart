import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import '../MotherPage/mother_page.dart';
import '../utils/widgets/textFields.dart';
import 'AdminLoginPage.dart';
import 'fade_animation.dart';

class AdminUpload extends StatefulWidget {
  const AdminUpload({Key? key}) : super(key: key);

  @override
  _AdminUploadState createState() => _AdminUploadState();
}

class _AdminUploadState extends State<AdminUpload> {
  final _hostelNameController = TextEditingController();
  final _hostelLocationController = TextEditingController();
  final _numberOfRoomAvailableController = TextEditingController();


  @override
  void dispose() {
    _hostelNameController.dispose();
   
    _hostelLocationController.dispose();
    _numberOfRoomAvailableController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              // Colors.purple,
              Colors.purple.shade600,
              Colors.deepPurpleAccent,
            ])),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: const FadeAnimation(
                  2,
                  Text(
                    "Upload your data to display on the main page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  margin: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            // color: Colors.red,
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 22, bottom: 20),
                            child: const FadeAnimation(
                              2,
                              Center(
                                child: Text(
                                  "upload data Here",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black87,
                                      letterSpacing: 2,
                                      fontFamily: "Lobster"),
                                ),
                              ),
                            )),
                         MyTextField(
                          hintext: 'Hostel Name',
                          iconData: Icons.home, controller: _hostelNameController, height: 70,
                        ),
                         MyTextField(
                          hintext: 'Hostel Location',
                          iconData: Icons.room_outlined, controller: _hostelLocationController, height: 70,
                        ),
                         MyTextField(
                            hintext: 'Number of Rooms Available',
                            iconData: Icons.location_city, controller: _numberOfRoomAvailableController, height: 70,),
                        MyTextField(
                          hintext: 'Hostel Describtion',
                          iconData: Icons.comment, controller: _hostelLocationController, height: 130,
                        ),
                        // FadeAnimation(
                        //   2,
                        //   Container(
                        //       width: double.infinity,
                        //       height: 130,
                        //       margin: const EdgeInsets.symmetric(
                        //           horizontal: 20, vertical: 20),
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 15, vertical: 5),
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //               color: Colors.purpleAccent, width: 1),
                        //           boxShadow: const [
                        //             BoxShadow(
                        //                 color: Colors.purpleAccent,
                        //                 blurRadius: 10,
                        //                 offset: Offset(1, 1)),
                        //           ],
                        //           color: Colors.white,
                        //           borderRadius: const BorderRadius.all(
                        //               Radius.circular(20))),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Expanded(
                        //             child: Container(
                        //               margin: const EdgeInsets.only(left: 10),
                        //               child: TextFormField(
                        //                 minLines: 6,
                        //                 maxLines: null,
                        //                 keyboardType: TextInputType.multiline,
                        //                 decoration: const InputDecoration(
                        //                   alignLabelWithHint: true,
                        //                   border: InputBorder.none,
                        //                   label: Text('Hostel Describtion'),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                        FadeAnimation(
                          2,
                          Container(
                              width: double.infinity,
                              height: 130,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purpleAccent, width: 1),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.purpleAccent,
                                        blurRadius: 10,
                                        offset: Offset(1, 1)),
                                  ],
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.image,
                                              size: 100,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Upload Hostel image',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          2,
                          ElevatedButton(
                            onPressed: () {
                              showAnimatedDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return ClassicGeneralDialogWidget(
                                    titleText: 'Thank You',
                                    contentText:
                                        'Your Data has been Submitted Succesfully!',
                                    onNegativeClick: () {
                                      Get.offAll(const NavigationHome());
                                    },
                                  );
                                },
                                animationType: DialogTransitionType.fadeRotate,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(seconds: 2),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purpleAccent, shadowColor: Colors.purpleAccent,
                                elevation: 18,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.purpleAccent,
                                    Colors.deepPurpleAccent
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}

