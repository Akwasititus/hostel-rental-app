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
              horizontal: deviceSize.width * 0.03,
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
                         Text('Welcome Suleman 👋',
                        style: AppBlackTextStyle.textpBlack
                      ),
                      Text('Looking for a Place to Stay?',
                      style: AppBlackTextStyle.texth1
                    ),
                      ],
                     ),
                     Expanded(child: Container()),
                     const ProfilePicture(
                      name: 'Johnson Suleman',
                      tooltip: true,
                      role: 'Student',
                      radius: 30,
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
                        color: Colors.grey.shade700,
                      fontFamily: 'Ubuntu-Regular'
                      )),
          ],
        ),
        const SizedBox(height: 10.0,),
        SizedBox(
          height: 250,
          child: Hero(
            tag: 'hostelImage',
            child: ListView.builder(
            itemCount: getAllHostles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Padding(
            padding: const EdgeInsets.all(7.0),
            child: GestureDetector(
              onTap: (){
                Get.to( const Detail(), arguments: {
                  'hostelsName': getAllHostles[index].hostelName.toString(),
                  'hostelLocation': getAllHostles[index].hostelLocation.toString(),
                  'imgURL': getAllHostles[index].hostelImage,
                  'amount': getAllHostles[index].amount.toString()
                  
                });
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
                      trailing:  Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: IconButton(
                              icon: Icon(Icons.favorite,color: favoriteColor? 
                              Colors.red:
                              Colors.white),
                              onPressed: () {
                                setState(() {
                                  favoriteColor = !favoriteColor;
                                });
                                /* Add to Favarate */
                              },
                            ),
                        ),
                      ),
                    ),
                    footer: GridTileBar(
                    backgroundColor:Colors.black54,
                    title: Text(getAllHostles[index].hostelName,
                     style: AppWhiteTextStyle.texth1),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(getAllHostles[index].hostleInfo,
                          style: AppWhiteTextStyle.texth2),
                          Text(getAllHostles[index].amount,
                          style: AppWhiteTextStyle.texth2),
                        ],
                      ),
                    ),
                  child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.2),topRight: Radius.circular(20.0)), // Image border
                  child: Image.asset(
                    getAllHostles[index].hostelImage,
                    height: 20.5,
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
            ));
            },),
          ),),
        
        
           const SizedBox(height: 15,),
          const Text('Resent',
          style: AppBlackTextStyle.texth2),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: getAllHostles.length,
            itemBuilder: (context,index){
              //final hostel = getAllHostles[index];
          return GestureDetector(
            onTap: (){
              
              Get.to( const Detail(), arguments: {
                'hostelsName': getAllHostles[index].hostelName.toString(),
                'hostelLocation': getAllHostles[index].hostelLocation.toString(),
                'imgURL': getAllHostles[index].hostelImage,
                'amount': getAllHostles[index].amount.toString()
              });
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
                    title: Text(getAllHostles[index].hostelName,
                    style: AppBlackTextStyle.texth1
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        Text(getAllHostles[index].hostelLocation,
                        style: AppBlackTextStyle.texth2),
                        const SizedBox(height: 7,),
                        Text(getAllHostles[index].hostleInfo,
                        style: AppBlackTextStyle.texth2
                        ),
                        Text(getAllHostles[index].amount,
                        style: AppBlackTextStyle.texth2
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Image border
                  child: Hero(
                     tag: 'hostelImage',
                    child: Image.asset(
                        getAllHostles[index].hostelImage,
                        fit: BoxFit.cover,
                        ),
                  ),
                  ),
                  trailing: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFcbe6f6),
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: IconButton(
                              icon: Icon(Icons.favorite,color: favoriteColor? 
                              Colors.red:
                              Colors.white),
                              onPressed: () {
                                setState(() {
                                  favoriteColor = !favoriteColor;
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