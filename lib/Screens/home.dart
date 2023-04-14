import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

import 'schools/UENR.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final List<String> _schools = const ['UENR','KNUST','UCC','UPSA','STU','UMAT','UG',];
                              
  final List<Widget> _hostels = [
  
             UENR(),
            Container(
              child: Text('Child 2'),
            ),
            Container(
              child: Text('Child 3'),
            ),
            Container(
              child: Text('Child 4'),
            ),
            Container(
              child: Text('Child 5'),
            ),
            Container(
              child: Text('Child 6'),
            ),
            Container(
              child: Text('Child 7'),
            ),
          ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [

        Expanded(
          child: TabContainer(
          color: const Color(0xFFcbe6f6),
          childCurve: Curves.easeInCirc,
          tabDuration: const Duration(milliseconds: 500),
          tabs: _schools,
          children: _hostels,
        ),
        ),
      
    ]),
    
    );
  }
}