import 'package:flutter/material.dart';
import '../../admin_page/fade_animation.dart';

class MyTextField extends StatelessWidget {
  final String hintext;
  final IconData iconData;
  final TextEditingController controller;
  final double height;

  const MyTextField({
    Key? key,
    required this.hintext,
    required this.iconData,
    required this.controller, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      2,
      Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purpleAccent, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.purpleAccent,
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  controller: controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: hintext,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
