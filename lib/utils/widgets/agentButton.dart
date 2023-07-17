import 'package:flutter/material.dart';

import '../constants.dart';

class AgentButton extends StatelessWidget {
  final String buttonName;

  const AgentButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      height: 50,
      width: double.infinity,
      decoration:  BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50.0)),
      child:  Center(
          child: Text(buttonName,
              style: AppWhiteTextStyle.texth1)),
    );
  }
}
