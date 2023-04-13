import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/hostelCardModel.dart';
import '../../Models/resentCardModel.dart';
import '../../utils/constants.dart';
import '../detailPage.dart';




class UENR extends StatefulWidget {
  const UENR({super.key});

  @override
  State<UENR> createState() => _UENRState();
}

class _UENRState extends State<UENR> {

  bool favoriteColor = false;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFcbe6f6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.05,
              vertical: deviceSize.height * 0.03
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                         Text('Welcome Titus 👋',
                        style: AppBlackTextStyle.textpBlack
                      ),
                      Text('Choose your Hostel',
                      style: AppBlackTextStyle.texth1
                    ),
                      ],
                     ),
                     Expanded(child: Container()),
                     const ProfilePicture(
                      name: 'Akwasi Titus',
                      tooltip: true,
                      role: 'Student',
                      radius: 30,
                      img: 'assets/images/rasta.jpg',
                       fontsize: 21,
                        ),
                     
                  ],
                ),
                const SizedBox(height: 10.0,),
                Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade100, 
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon:  IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* do clear */
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
        
        const SizedBox(height: 15,),
        Row(
          children: [
            const Text('Popular',style: AppBlackTextStyle.texth2),
            Expanded(child: Container()),
            Text('more',style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade200,
                      fontFamily: 'Ubuntu-Regular'
                      )),
          ],
        ),
        const SizedBox(height: 10.0,),
        SizedBox(
          height: 250,
          child: ListView.builder(
          itemCount: getPopularHostles.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
          padding: const EdgeInsets.all(7.0),
          child: GestureDetector(
            onTap: (){
              Get.to(const Detail(), arguments: {
                'roomImg': getPopularHostles[index].hostelImage,
                'hostelName': getPopularHostles[index].hostelName.toString(),
                'hostleInfo': getPopularHostles[index].hostleInfo.toString(),
                
              });
            },
            child: Container(
              height: 100,
              width: 200,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GridTile(
                  header: GridTileBar(
                    trailing:  IconButton(
                        icon: Icon(Icons.favorite,color: favoriteColor? Colors.white:Colors.red),
                        onPressed: () {
                          setState(() {
                            favoriteColor = favoriteColor;
                          });
                          /* Add to Favarate */
                        },
                      ),
                  ),
                  footer: GridTileBar(
                  backgroundColor:Colors.black54,
                  title: Text(getPopularHostles[index].hostelName,
                   style: AppWhiteTextStyle.texth1),
                    subtitle: Text(getPopularHostles[index].hostleInfo,
                    style: AppWhiteTextStyle.texth2),
                  ),
                child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.2),topRight: Radius.circular(20.0)), // Image border
                child: Image.asset(
                  getPopularHostles[index].hostelImage,
                  height: 20.5,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
          ));
          },),),
        
        
           const SizedBox(height: 15,),
          const Text('Resent',
          style: AppBlackTextStyle.texth2),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: getResentHostels.length,
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Get.to(const Detail(), arguments: index);
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
                child: ListTile(
                  title: Text(getResentHostels[index].hostelName,
                  style: AppBlackTextStyle.texth1
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(getResentHostels[index].hostelLocation,
                      style: AppBlackTextStyle.texth2),
                      const SizedBox(height: 7,),
                      Text(getResentHostels[index].roomInfo,
                      style: AppBlackTextStyle.texth2
                      )
                    ],
                  ),
                  leading: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Image border
                child: Image.asset(
                    getResentHostels[index].imgURL,
                    fit: BoxFit.cover,
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
      floatingActionButton: FloatingActionButton(
        child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  /* do clear */
              },
            ),
        onPressed: (){
          print('Presesd');
          }),
      ),
    );
    
  }
}