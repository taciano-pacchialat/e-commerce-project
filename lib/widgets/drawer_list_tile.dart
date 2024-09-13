import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(
          left: 28.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      onTap: onTap,
    );
  }
}
