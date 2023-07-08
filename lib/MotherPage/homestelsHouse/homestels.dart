import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants.dart';
import 'homestelAreas.dart';
import 'homestelsDetails.dart';

class Homestels extends StatelessWidget {
  const Homestels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            forceElevated: true,
            floating: true,
            elevation: 20,
            title: const Text('Homestel'),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/hostel3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3 / 2,
            ),
            delegate: SliverChildBuilderDelegate(
              
              (BuildContext context, int index) {
                final homestelAreas = getHomestelAreas[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                              Get.to( const HomestelsDetails(),
                               arguments: {
                                // -------------------------------------------------
                                // these are argument from the model page that are being passed to the detailed screen
                                // ---------------------------------------------------
                                'homestelName': homestelAreas.homestelName.toString(),
                                'homestelMinWalk': homestelAreas.minWalk.toString(),
                                'landlordName': homestelAreas.landlordName.toString(),
                                'roomType': homestelAreas.roomType.toString(),
                                'roomImg': homestelAreas.roomImg,
                                'roomAmount': homestelAreas.roomAmount,
                                
                                
                               },
                              duration: const Duration(seconds: 1),transition: Transition.native);
                            },
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child:  Center(
                          child: ListTile(
                            title: Text(homestelAreas.homestelName, style: AppBlackTextStyle.texth1),
                            subtitle: Text(homestelAreas.minWalk,
                                style: AppBlackTextStyle.texth4),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        )
                        ),
                  ),
                );
              },
              childCount: getHomestelAreas.length,
            ),
          ),
        ],
      ), // //
    );
  }
}

