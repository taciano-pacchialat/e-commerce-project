import 'package:flutter/material.dart';
import 'package:frontend/constants/app_colors.dart';
import 'package:frontend/widgets/drawer_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  final List<String> drawerItems;

  const CustomDrawer({
    super.key,
    required this.drawerItems,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: AppColors.primaryCream,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      width: screenWidth * 0.7,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: drawerItems.length + 2, // +1 for the header & box
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              color: AppColors.primaryBurgundy,
              padding: const EdgeInsets.only(
                left: 18.0,
                top: 8.0,
                bottom: 10.0,
              ),
              child: const Text(
                'Charly Store',
                style: TextStyle(
                  color: AppColors.primaryCream,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          } else if (index == 1) {
            return const SizedBox(height: 22.0);
          } else {
            final title = drawerItems[index - 2];
            return DrawerListTile(
              title: title,
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
          return [0, 1].contains(index)
              ? const SizedBox.shrink()
              : Divider(
                  height: 1.0,
                  indent: screenWidth * 0.08,
                  endIndent: screenWidth * 0.08,
                  color: AppColors.secondaryGold,
                );
        },
      ),
    );
  }
}
