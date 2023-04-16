import 'package:flutter/material.dart';

import '../Models/hostelCardModel.dart';
import '../utils/constants.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fav Items'),),
      body: Column(children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index){
              return Container(
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
                              icon: const Icon(Icons.remove_circle_outline,color:  
                              Colors.red
                             ),
                              onPressed: () {
                                // setState(() {
                                //   favoriteColor = !favoriteColor;
                                // });
                                /* Add to Favarate */
                              },
                            ),
                        ),
                  ),
                ),
              );
            }),
        )
      ]),
    );
  }
}