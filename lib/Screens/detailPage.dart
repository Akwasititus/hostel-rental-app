import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:readmore/readmore.dart';

import '../Models/hostelCardModel.dart';
import '../utils/constants.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});


final String readmoreText = "Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the   ";
       
       
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
        
        children: [
     
          SizedBox(
            height: 300,
            child: GridTile(
              footer:   GridTileBar(
                  backgroundColor:Colors.black54,
                  title: const Text('Samel Hostel',
               style: AppWhiteTextStyle.texth1),
                    subtitle: const Text('Loc: Tepa Wioso',
                style: AppWhiteTextStyle.texth2),
                trailing: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        fixedSize: const Size(150, 50),
                        backgroundColor: const Color.fromARGB(255, 66, 76, 168),
                        textStyle: const TextStyle(fontSize: 21)),
                    child: const Text('Intrested'),
          ),
                  ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
                child: Image.asset(
                  'assets/images/hostel1.jpg',
                  height: 200.5,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
     
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.05,
              vertical: deviceSize.height * 0.05
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               
              const Text('Details',style: AppBlackTextStyle.texth2),
        
              const SizedBox(height: 5.0,),
     
              ReadMoreText(readmoreText, 
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'read more',
              trimExpandedText: '...Show less',
              style: AppBlackTextStyle.texth3,
              lessStyle: const TextStyle(fontWeight: FontWeight.bold),
              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
     
            const SizedBox(height: 10.0,),
     
            Row(children: [
                  const ProfilePicture(
                      name: 'Akwasi Titus',
                      tooltip: true,
                      radius: 31,
                      role: 'Hostel Manager',
                       fontsize: 21,
                        ),
                        const SizedBox(width: 10.0,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      Text('TITUS Akwasi',style: AppBlackTextStyle.texth2),
                      SizedBox(height: 3.0,),   
                      Text('Hostel Manager@ Samuel Hostel',style: AppBlackTextStyle.texth4),
                        ],
                            )
            ],),
     
            const SizedBox(height: 15,),

            const Text('More Rooms',style: AppBlackTextStyle.texth2),
            const SizedBox(height: 5,),
            CarouselSlider.builder(
              options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
          ),
              itemCount: getPopularHostles.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.2),bottomRight: Radius.circular(20.0)), // Image border
            child: Image.asset(
              getPopularHostles[itemIndex].hostelImage,
              height: 20.5,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
     )
            
           
        
            ],
          ),
        )
          
     
        ],
       ),
     ),
    );
  }
}



