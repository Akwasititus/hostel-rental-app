import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

import 'schools/UENR.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<String> _schools = const [
    'UENR',
    'STU',
    'CUG ',
  ];

  final List<Widget> _hostels = [
    const UENR(),
    Column(
      children:  [
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('STU Loading soon')
          ],
        )),
      ],
    ),
    Column(
      children:  [
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('Catholic University Loading')
          ],
        )),
      ],
    ),
    
    
    
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
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
      ),
    );
  }
}
