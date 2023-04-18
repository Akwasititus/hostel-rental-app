import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
            title: const Text('Find My Hostel'),
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
              childAspectRatio: 3/2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                          child: const Center(
                            child: ListTile(
                              title: Text('Zinko',style: AppBlackTextStyle.texth1),
                              subtitle: Text('10min wallk',style: AppBlackTextStyle.texth4),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          )
                        ),
                );
              },
              childCount: 50,
            ),
          ),
          
        ],
      ),// //
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       
      
    );
  }
}