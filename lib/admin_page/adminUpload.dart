import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../MotherPage/mother_page.dart';
import '../utils/functions/add.dart';
import '../utils/functions/imageUpload.dart';
import '../utils/widgets/textFields.dart';
import 'fade_animation.dart';
import 'package:flutter/services.dart';

class AdminUpload extends StatefulWidget {
  const AdminUpload({Key? key}) : super(key: key);

  @override
  _AdminUploadState createState() => _AdminUploadState();
}



// A nullable variable '_image' of type 'Uint8List', possibly containing an image in bytes.
Uint8List? _image;


class _AdminUploadState extends State<AdminUpload> {
  ///Text controllers
  final _hostelNameController = TextEditingController();
  final _hostelLocationController = TextEditingController();
  final _hostelDescController = TextEditingController();
  //final _numberOfRoomAvailableController = TextEditingController();
  final _hostelEmailController = TextEditingController();

  

  ///selecting Hostel Image
  void selectedImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);

    /// display image when selected
    setState(() {
      _image = img;
    });
  }

  

  /// saving data to Firebase Database
  void savedData() async {
    String hostelNameController = _hostelNameController.text; 
    String hostelLocationController = _hostelLocationController.text;
    String hostelDescController = _hostelDescController.text;
    String hostelEmailController = _hostelEmailController.text;
    // String numberOfRoomAvailableController =
    //     _numberOfRoomAvailableController.text;

    String resp = await StoreData().saveData(
        hostelName: hostelNameController,
        hostelLocation: hostelLocationController,
        hostelDesc: hostelDescController,
        hostelEmail: hostelEmailController,
        //numberOfRoomAvailable: numberOfRoomAvailableController,
        file: _image!);
  }

  

  @override
  void dispose() {
    _hostelNameController.dispose();
    _hostelLocationController.dispose();
    _hostelDescController.dispose();
    _hostelEmailController.dispose();
    //_numberOfRoomAvailableController.dispose();
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
                          iconData: Icons.home,
                          controller: _hostelNameController,
                          height: 70,
                        ),
                        MyTextField(
                          hintext: 'Hostel Location',
                          iconData: Icons.room_outlined,
                          controller: _hostelLocationController,
                          height: 70,
                        ),
                        MyTextField(
                          hintext: 'Hostel Email',
                          iconData: Icons.email_rounded,
                          controller: _hostelEmailController,
                          height: 70,
                        ),
                        // MyTextField(
                        //   hintext: 'Number of Rooms Available',
                        //   iconData: Icons.location_city,
                        //   controller: _numberOfRoomAvailableController,
                        //   height: 70,
                        // ),
                        // MyTextField(
                        //   hintext: 'Hostel Describtion',
                        //   iconData: Icons.comment, controller: _hostelLocationController, height: 130,
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
                                      child: TextFormField(
                                        minLines: 6,
                                        maxLines: null,
                                        controller: _hostelDescController,
                                        keyboardType: TextInputType.multiline,
                                        decoration: const InputDecoration(
                                          alignLabelWithHint: true,
                                          border: InputBorder.none,
                                          label: Text('Hostel Describtion'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
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
                                          children: [
                                            // Icon(
                                            //   Icons.image,
                                            //   size: 100,
                                            //   color: Colors.grey,
                                            // ),

                                            SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                backgroundImage: _image != null
                                                    ? MemoryImage(_image!)
                                                    : null,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      bottom: 5,
                                                      right: 5,
                                                      child: GestureDetector(
                                                        onTap: selectedImage,
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xff60392C),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: const Icon(
                                                            Icons
                                                                .camera_alt_sharp,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Text(
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
                              // function to save the data to firestore
                              savedData();

                              /// success message
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
                                foregroundColor: Colors.purpleAccent,
                                shadowColor: Colors.purpleAccent,
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
