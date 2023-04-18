import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../Models/hostelCardModel.dart';
import '../utils/constants.dart';
import '../utils/widgets/buttons.dart';

class Detail extends StatefulWidget {
   
  const Detail({super.key,});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

 
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size; 
    final hostelsArguments = Get.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFcbe6f6),
       body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: GridTile(
                header: GridTileBar(
                  leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFcbe6f6),
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                        ),
                ),
                footer:   GridTileBar(
                    backgroundColor:Colors.black54,
                    title: Text(hostelsArguments['hostelsName'],
                 style: AppWhiteTextStyle.texth1),
                      subtitle: Text(hostelsArguments['hostelLocation'],
                  style: AppWhiteTextStyle.texth2),
                  trailing: OutlinedButton(
                      onPressed: () {
                        showMyDialog();
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 50),
                          backgroundColor: const Color(0xFFcbe6f6),
                          textStyle: const TextStyle(fontSize: 17)),
                      child: const Text('Make Payment',
                           style: AppBlackTextStyle.texth1),
            ),
                    ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                  child: Hero(
                     tag: 'hostelImage',
                    child: Material(
                      elevation: 0,
                      child: Image.asset(hostelsArguments['imgURL'],
                        height: 200.5,
                        fit: BoxFit.cover,
                        ),
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.05,
                vertical: deviceSize.height * 0.03
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [   
                const Text('Details',style: AppBlackTextStyle.texth1),
                const SizedBox(height: 5.0,),
                const ReadMoreText(readmoreText, 
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'read more',
                trimExpandedText: '...Show less',
                style: AppBlackTextStyle.texth3,
                lessStyle: TextStyle(fontWeight: FontWeight.bold),
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
       
              const SizedBox(height: 10.0,),
       
              Row(children: [
                    const ProfilePicture(
                        name: 'Titus Akwasi ',
                        tooltip: true,
                        radius: 25,
                        role: 'Hostel Manager',
                         fontsize: 21,
                          ),
                          const SizedBox(width: 10.0,),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                        const Text('TITUS Akwasi',style: AppBlackTextStyle.texth2),
                        const SizedBox(height: 3.0,),   
                        Row(
                          children: [
                            const Text('Hostel Manager@ ',style: AppBlackTextStyle.texth4),
                            Text(hostelsArguments['hostelsName'],style: AppBlackTextStyle.texth4)
                          ],
                        ),
                          ],
                        )
              ],),
       
              const SizedBox(height: 15,),
    
              const Text('Other Rooms',style: AppBlackTextStyle.texth1),
              const SizedBox(height: 5,),
              CarouselSlider.builder(
                options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
            ),
                itemCount: getAllHostles.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.2),bottomRight: Radius.circular(20.0)), // Image border
              child: Image.asset(
               hostelsArguments['imgURL'],
               // getPopularHostles[itemIndex].hostelImage,
                height: 50.5,
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
      ),
    );
  }

   void showMyDialog() {
  Get.dialog(
    AlertDialog(
      title: const Text('Please Choose an Option'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons(btnName: 'One in a Room', clickMe: () {  }, hostelAmount: '\$1,200',),
          Buttons(btnName: 'Two in a Room', clickMe: () {  }, hostelAmount: '\$2,700',),
          Buttons(btnName: 'Three in a Room', clickMe: () {  }, hostelAmount: '\$9,200',),
          Buttons(btnName: 'Four in a Room', clickMe: () {  }, hostelAmount: '\$4,300',),
        ],
      ),
      
    ),
  );
}

}



