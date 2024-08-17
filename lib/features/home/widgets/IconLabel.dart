import 'package:flutter/material.dart';
import 'package:pnb_one/constant/colors.dart';

class IconLabel extends StatelessWidget {
  const IconLabel(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon});
  final String text1;
  final String text2;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: secondaryBlack,
            child: Icon(
              icon,
              color: primaryWhite,
            ),
            radius: 25,
          ),
          Text(
            text1,
            softWrap: true,
            style: TextStyle(color: primaryWhite),
          ),
          Text(
            text2,
            softWrap: true,
            style: TextStyle(color: primaryWhite),
          )
        ],
      ),
    );
  }
}
