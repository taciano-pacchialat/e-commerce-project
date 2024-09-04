import 'package:flutter/material.dart';
import 'package:frontend/widgets/drawer_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final double titleFontSize;
  final double drawerItemFontSize;
  final List<String> drawerItems;

  const CustomDrawer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.titleFontSize,
    required this.drawerItemFontSize,
    required this.drawerItems,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      width: screenWidth * 0.7,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: drawerItems.length + 1, // +1 for the header
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                top: screenHeight * 0.02,
                bottom: screenHeight * 0.02,
              ),
              child: Text(
                'Charly Store',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            final title = drawerItems[index - 1];
            return DrawerListTile(
              title: title,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              fontSize: drawerItemFontSize,
              fontWeight: FontWeight.w100,
              onTap: () {
                // TODO: handle navigation based on the title
                if (title == 'Home') {
                  // Navigate to home screen
                } else if (title == 'Categories') {
                  // Navigate to categories
                } else if (title == 'Help & Support') {
                  // Navigate to help & support
                }
              },
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return index == 0
              ? const SizedBox.shrink()
              : Divider(
                  indent: screenWidth * 0.08,
                  endIndent: screenWidth * 0.08,
                );
        },
      ),
    );
  }
}
