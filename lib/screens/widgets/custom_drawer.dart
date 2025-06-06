import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/widgets/header_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../gen/assets.gen.dart';
import 'language_dropdown.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: AppColors.scaffold),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              TextButton(
                onPressed: () {},
                child: HeaderLabel(title: 'Art Vault'),
              ),
              TextButton(
                onPressed: () {},
                child: HeaderLabel(title: 'Journal'),
              ),
              if(isMobile) Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.icons.profile),
                  ),

                  LanguageDropdown(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
