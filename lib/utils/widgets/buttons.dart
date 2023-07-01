import 'package:flutter/material.dart';

import '../constants.dart';

class Buttons extends StatelessWidget {
  final String btnName;
  final VoidCallback clickMe;
  final String hostelAmount;
  final Color colour;

  Buttons({required this.btnName, required this.clickMe, required this.hostelAmount, required this.colour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickMe,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          leading: Text(btnName,style: AppWhiteTextStyle.texth1),
          trailing: Text(hostelAmount,style: AppWhiteTextStyle.texth1),
           ),
      ),
    );
  }
}