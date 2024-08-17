import 'package:flutter/material.dart';
import 'package:pnb_one/constant/colors.dart';

class Smallcard extends StatelessWidget {
  const Smallcard({
    super.key,
    required this.text1,
    required this.text2,
    required this.icon,
  });
  final String text1;
  final String text2;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(color: primaryWhite),
                ),
                Text(
                  text2,
                  style: TextStyle(color: primaryWhite),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: primaryWhite,
            ),
          )
        ],
      ),
    );
  }
}
