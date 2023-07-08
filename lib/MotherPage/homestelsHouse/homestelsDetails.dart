import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'homestelAreas.dart';
import 'homestelHousesDesc.dart';



class HomestelsDetails extends StatelessWidget {
  const HomestelsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // media querry to check screen sizes
    var deviceSize = MediaQuery.of(context).size;

    // accepting argument from 'hosmestelAreas.dart'
    final hostelsArguments = Get.arguments;

    final homestelName = hostelsArguments['homestelName'];
    final homestelMinWalk = hostelsArguments['homestelMinWalk'];
    final landlordName = hostelsArguments['landlordName'];
    final roomType = hostelsArguments['roomType'];
    final roomImg = hostelsArguments['roomImg'];
    final roomAmount = hostelsArguments['roomAmount'];

    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFcbe6f6),
        title: Text(homestelName, style: AppBlackTextStyle.texth1),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 15),
              const Text('Available Houses Around',
                  style: AppBlackTextStyle.texth1),
              const SizedBox(height: 5),
              Text(homestelMinWalk, style: AppBlackTextStyle.texth2),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  //final hostelsArgument = HomestelAreas[index];
                  return GestureDetector(
                      onTap: () {
                        Get.to(const HomestelHouseDesc(),
                            arguments: {
                              'roomImg': hostelsArguments['roomImg'],
                              'homestelName': hostelsArguments['homestelName'],
                              'landlordName': hostelsArguments['landlordName'],
                              'roomType': hostelsArguments['roomType'],
                              'roomAmount': hostelsArguments['roomAmount'],
                              'homestelMinWalk': hostelsArguments['homestelMinWalk'],
                              
                            },
                            duration: const Duration(seconds: 1),
                            transition: Transition.native);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceSize.width * 0.03,
                            vertical: deviceSize.height * 0.01),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: ListTile(
                                title: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    roomImg
                                  ),
                                ),
                                subtitle: Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0))),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Icon(Icons.person,
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                            ),
                                             Text(landlordName,
                                                style:
                                                    AppWhiteTextStyle.texth1),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Icon(
                                                  Icons.location_city_outlined,
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                            ),
                                             Text(roomType,
                                                style:
                                                    AppWhiteTextStyle.texth1),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Icon(Icons.money,
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                            ),
                                             Text(roomAmount,
                                                style:
                                                    AppWhiteTextStyle.texth1),
                                          ],
                                        ),
                                      ]),
                                ))),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}






// class HomestelDesc {
//   final String landlordName;
//   final String houseLocation;
//   final String roomAmount;
//   final String houseImg;

//   HomestelDesc({
//     required this.landlordName,
//     required this.houseLocation,
//     required this.roomAmount,
//     required this.houseImg,
//   });
// }

// List<HomestelDesc> getHomestelDesc = [
//   HomestelDesc(
//       houseLocation: 'Fiapre',
//       landlordName: 'Dr. Patrick Mensah',
//       roomAmount: '2,500',
//       houseImg: 'assets/images/Erichostel.jpg'),
//       HomestelDesc(
//       houseLocation: 'Fiapre',
//       landlordName: 'Dr. Patrick Mensah',
//       roomAmount: '2,500',
//       houseImg: 'assets/images/Erichostel.jpg'),
//       HomestelDesc(
//       houseLocation: 'Fiapre',
//       landlordName: 'Dr. Patrick Mensah',
//       roomAmount: '2,500',
//       houseImg: 'assets/images/Erichostel.jpg'),
//       HomestelDesc(
//       houseLocation: 'Fiapre',
//       landlordName: 'Dr. Patrick Mensah',
//       roomAmount: '2,500',
//       houseImg: 'assets/images/Erichostel.jpg'),
//       HomestelDesc(
//       houseLocation: 'Fiapre',
//       landlordName: 'Dr. Patrick Mensah',
//       roomAmount: '2,500',
//       houseImg: 'assets/images/Erichostel.jpg'),
// ];
