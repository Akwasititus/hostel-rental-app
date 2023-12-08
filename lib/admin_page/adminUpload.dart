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
  final _agentEmailController = TextEditingController();

  // room types
  final _oneinaRoomController = TextEditingController();
  final _twoInaRoomController = TextEditingController();
  final _threeinaRoomController = TextEditingController();
  final _fourinaRoomController = TextEditingController();

  

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
    String agentEmailController = _agentEmailController.text;

    // room type
    String oneinaRoomController = _oneinaRoomController.text;
    String twoInaRoomController = _twoInaRoomController.text;
    String threeinaRoomController = _threeinaRoomController.text;
    String fourinaRoomController = _fourinaRoomController.text;

   

    String resp = await StoreData().saveData(
        hostelName: hostelNameController,
        hostelLocation: hostelLocationController,
        hostelDesc: hostelDescController,
        agentEmail: agentEmailController,
        

        // // room type
        // oneinaRoom: oneinaRoomController.,
        // twoInaRoom: twoInaRoomController,
        // threeinaRoom: threeinaRoomController,
        // fourinaRoom: fourinaRoomController,

        // room type
oneinaRoom: int.tryParse(oneinaRoomController) ?? 0,
twoInaRoom: int.tryParse(twoInaRoomController) ?? 0,
threeinaRoom: int.tryParse(threeinaRoomController) ?? 0,
fourinaRoom: int.tryParse(fourinaRoomController) ?? 0,

        
        file: _image!);
  }

  

  @override
  void dispose() {
    _hostelNameController.dispose();
    _hostelLocationController.dispose();
    _hostelDescController.dispose();
    _agentEmailController.dispose();
    
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFcbe6f6)),
          child: Column(
            children: [
              Align(
                      alignment: Alignment.topRight,
                      child: BackButton()),
                     Image.asset('assets/images/logo.png',height: 50),
              Container(
                  
                  child:
                    Text(
                      "Upload your data to display on the main page",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            
                            topRight: Radius.circular(20))),
                    margin: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              // color: Colors.red,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 22, bottom: 20),
                              child: 
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
                              ),
                          
                             MyTextField(
                              hintext: 'Hostel Name',
                              iconData: Icons.home,
                              controller: _hostelNameController,
                              height: 70, keyboardType: TextInputType.text,
                            ),
                          
                           MyTextField(
                              hintext: 'Hostel Location',
                              iconData: Icons.room_outlined,
                              controller: _hostelLocationController,
                              height: 70, keyboardType: TextInputType.text,
                            ),
                          
                           MyTextField(
                              hintext: 'Agent Email',
                              iconData: Icons.email_rounded,
                              controller: _agentEmailController,
                              height: 70, keyboardType: TextInputType.emailAddress,
                            ),
                          
    
                          //Room Types
                          const Text('Enter Fixed Amount for the Room Types'),
                           MyTextField(
                            hintext: 'One in a Room',
                            iconData: Icons.one_k,
                            controller: _oneinaRoomController,
                            height: 70, keyboardType: TextInputType.number,
                          ),
                           MyTextField(
                            hintext: 'Two in a Room',
                            iconData: Icons.two_k_outlined,
                            controller: _twoInaRoomController,
                            height: 70,keyboardType: TextInputType.number,
                          ),
                           MyTextField(
                            hintext: 'Three in a Room',
                            iconData: Icons.three_k,
                            controller: _threeinaRoomController,
                            height: 70,keyboardType: TextInputType.number,
                          ),
                           MyTextField(
                            hintext: 'four in a Room',
                            iconData: Icons.four_k_outlined,
                            controller: _fourinaRoomController,
                            height: 70,keyboardType: TextInputType.number,
                          ),
                          
                            Container(
                                width: double.infinity,
                                height: 130,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
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
                                            border: OutlineInputBorder(),
                                            label: Text('Hostel Describtion'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                         
                            Container(
                                width: double.infinity,
                                height: 130,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
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
                          
                          const SizedBox(
                            height: 10,
                          ),
                          
                            ElevatedButton(
                              onPressed: () {
                                /// function to save the data to firestore
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
                                  foregroundColor: Colors.blue,
                                  shadowColor: Colors.blue,
                                  elevation: 18,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.white10
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
                          
                          const SizedBox(height: 20),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
