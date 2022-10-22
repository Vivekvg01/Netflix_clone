import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.icon,
    this.fontSize = 16,
    this.iconSize = 25,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
