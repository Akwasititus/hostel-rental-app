import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import '../../Models/hostelCardModel.dart';
import '../../utils/constants.dart';
import '../detailPage.dart';

class UENR extends StatefulWidget {
  const UENR({super.key});

  @override
  State<UENR> createState() => _UENRState();
}

class _UENRState extends State<UENR> {

  //-------------------------------------------------------------
  // selecting fav 
  //-------------------------------------------------------------
  bool favoriteColor = false;

  //-------------------------------------------------------------
  //  controller for the search
  //-------------------------------------------------------------
  final TextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------------------
    // media query for checking screen sizes
    //-------------------------------------------------------------
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFcbe6f6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.03,
                vertical: deviceSize.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Welcome Suleman 👋',
                            style: AppBlackTextStyle.textpBlack),
                        Text('Looking for a Place to Stay?',
                            style: AppBlackTextStyle.texth1),
                      ],
                    ),
                    Expanded(child: Container()),
                    const ProfilePicture(
                      name: 'Johnson Suleman',
                      tooltip: true,
                      role: 'Student',
                      radius: 20,
                      fontsize: 21,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ///-------------------------------------------------------------
                /// Search view 
                ///-------------------------------------------------------------
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextField(
                      controller: TextFieldController,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              TextFieldController.clear();
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              /* do search */
                            },
                          ),
                          hintText: 'Lasvegas Hostle',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                //-------------------------------------------------------------
                // Search view ends here
                //-------------------------------------------------------------
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text('Popular', style: AppBlackTextStyle.texth2),
                    Expanded(child: Container()),
                    Text('more',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            fontFamily: 'Ubuntu-Regular')),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                //-------------------------------------------------------------
                // This list view shows a list of pupolar hostels 
                //-------------------------------------------------------------
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: getAllHostles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final hostel = getAllHostles[index];
                      return Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to( Detail(), arguments: {
                                //-------------------------------------------------
                                // these are argument from the model page that are being passed to the detailed screen
                                //---------------------------------------------------
                                'hostelsName': hostel.hostelName.toString(),
                                'hostelsEmail': hostel.hostelEmail.toString(),
                                'hostelsDesc': hostel.hostleInfo.toString(),
                                'hostelLocation': hostel.hostelLocation.toString(),
                                'imgURL': hostel.hostelImage,
                                'hostelRooms': hostel.hostelRooms,
                                'amount': hostel.numberOfRoomsAvailable.toString(),
                              },duration: const Duration(seconds: 1),transition: Transition.native);
                            },
                            child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                color: const Color(0xFFcbe6f6),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: GridTile(
                                header: GridTileBar(
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: IconButton(
                                        icon: Icon(
                                            hostel.favIcon
                                                ? Icons.favorite
                                                : Icons.thumb_up_alt_rounded,
                                            color: hostel.favIcon
                                                ? Colors.red
                                                : Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            hostel.favIcon = !hostel.favIcon;
                                          });
                                          /* Add to Favarate */
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                footer: GridTileBar(
                                  backgroundColor: Colors.black54,
                                  title: Text(hostel.hostelName,
                                      style: AppWhiteTextStyle.texth1),
                                  subtitle: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(hostel.hostelLocation,
                                          style: AppWhiteTextStyle.texth2),
                                      Text(hostel.numberOfRoomsAvailable,
                                          style: AppWhiteTextStyle.texth2),
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.2),
                                      topRight: Radius.circular(
                                          20.0)), // Image border
                                  child: Image.asset(
                                    hostel.hostelImage,
                                    height: 20.5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Resent', style: AppBlackTextStyle.texth2),
                //-------------------------------------------------------------
                // this is a list view that shows a list of the resent hostels 
                //-------------------------------------------------------------
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: getAllHostles.length,
                      itemBuilder: (context, index) {
                        final hostel1 = getAllHostles[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to( Detail(), arguments: {
                              //-------------------------------------------------
                                // these are argument from the model page that are being passed to the detailed screen
                                //---------------------------------------------------
                              'hostelsName': hostel1.hostelName.toString(),
                              'hostelLocation':
                                  hostel1.hostelLocation.toString(),
                              'imgURL': hostel1.hostelImage,
                              // 'hostelRooms': hostel1.hostelRooms,
                              'amount':
                                  hostel1.numberOfRoomsAvailable.toString()
                            },duration: const Duration(seconds: 1),transition: Transition.native);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: ListTile(
                                  title: Text(hostel1.hostelName,
                                      style: AppBlackTextStyle.texth1),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(hostel1.hostelLocation,
                                          style: AppBlackTextStyle.texth2),
                                      
                                      Text(hostel1.numberOfRoomsAvailable,
                                          style: AppBlackTextStyle.texth2),
                                    ],
                                  ),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      hostel1.hostelImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFcbe6f6),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: IconButton(
                                      icon: Icon(
                                          hostel1.favIcon
                                              ? Icons.favorite
                                              : Icons.thumb_up_alt_rounded,
                                          color: hostel1.favIcon
                                              ? Colors.red
                                              : Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          hostel1.favIcon = !hostel1.favIcon;
                                        });
                                        /* Add to Favarate */
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
