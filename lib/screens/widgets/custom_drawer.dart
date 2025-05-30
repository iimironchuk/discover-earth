import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/widgets/header_label.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: AppColors.scaffold),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: HeaderLabel(title: 'Living Gallery'),
            ),
            TextButton(
              onPressed: () {},
              child: HeaderLabel(title: 'Expeditions'),
            ),
            TextButton(
              onPressed: () {},
              child: HeaderLabel(title: 'Nature Patrons'),
            ),
            TextButton(onPressed: () {}, child: HeaderLabel(title: 'Art Vault')),
            TextButton(onPressed: () {}, child: HeaderLabel(title: 'Journal')),
          ],
        ),
      ),
    );
  }
}
