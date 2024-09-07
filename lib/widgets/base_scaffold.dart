import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:e_commerce_project/constants/drawer_items.dart';
import 'package:e_commerce_project/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;

  const BaseScaffold(
      {super.key,
      required this.body,
      required this.title,
      this.actions,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBurgundy,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryCream,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.primaryCream,
        ),
        actions: actions,
      ),
      drawer: const CustomDrawer(drawerItems: DrawerItems.items),
      backgroundColor: AppColors.primaryCream,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
