import 'package:flutter/material.dart';

import '../constants.dart';

class Buttons extends StatelessWidget {
  final String btnName;
  final VoidCallback clickMe;
  final String hostelAmount;

  Buttons({required this.btnName, required this.clickMe, required this.hostelAmount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickMe,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          leading: Text(btnName,style: AppWhiteTextStyle.texth2),
          trailing: Text(hostelAmount,style: AppWhiteTextStyle.texth2),
           ),
      ),
    );
  }
}