import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/widgets/header_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../gen/assets.gen.dart';
import 'language_dropdown.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onScrollToGallery;
  final VoidCallback onScrollToExpeditions;
  final VoidCallback onScrollToNaturePatrons;
  final VoidCallback onScrollToArtVault;
  final VoidCallback onScrollToJournal;

  const CustomDrawer({
    super.key,
    required this.onScrollToGallery,
    required this.onScrollToExpeditions,
    required this.onScrollToNaturePatrons,
    required this.onScrollToArtVault,
    required this.onScrollToJournal,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: AppColors.scaffold),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45.0,),
                HeaderLabel(title: 'Living Gallery', onTap: onScrollToGallery),
                SizedBox(height: 15.0,),
                HeaderLabel(title: 'Expeditions', onTap: onScrollToExpeditions),
                SizedBox(height: 15.0,),
                HeaderLabel(
                  title: 'Nature Patrons',
                  onTap: onScrollToNaturePatrons,
                ),
                SizedBox(height: 15.0,),
                HeaderLabel(title: 'Art Vault', onTap: onScrollToArtVault),
                SizedBox(height: 15.0,),
                HeaderLabel(title: 'Journal', onTap: onScrollToJournal),
                Spacer(),
                if (isMobile)
                  Row(
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
                SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
