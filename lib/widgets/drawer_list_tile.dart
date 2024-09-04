import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final double screenWidth;
  final double screenHeight;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.screenWidth,
    required this.screenHeight,
    required this.fontSize,
    required this.fontWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.07,
          top: screenHeight * 0.01,
          bottom: screenHeight * 0.01,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
