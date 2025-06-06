import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/expeditions_screen/expeditions_screen.dart';
import 'package:discover_earth/screens/gallery_screen/gallery_screen.dart';
import 'package:discover_earth/screens/main_screen.dart';
import 'package:discover_earth/screens/patrons_club_screen/patrons_club_screen.dart';
import 'package:discover_earth/screens/widgets/custom_drawer.dart';
import 'package:discover_earth/screens/widgets/header_label.dart';
import 'package:discover_earth/screens/widgets/language_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.scaffold,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               MediaQuery.of(context).size.width < 1100
                  ? Builder(
                    builder:
                        (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: SvgPicture.asset(Assets.icons.drawer),
                        ),
                  )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 47.0),
                child: Text(
                  'Eden Reverie',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: isMobile ? 20.0 : 30.0
                  ),
                ),
              ),
              if (!smallerThanDesktop &&
                  MediaQuery.of(context).size.width > 1100)
                SeparatedRow(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    HeaderLabel(title: 'Living Gallery'),
                    HeaderLabel(title: 'Expeditions'),
                    HeaderLabel(title: 'Nature Patrons'),
                    HeaderLabel(title: 'Art Vault'),
                    HeaderLabel(title: 'Journal'),
                  ],
                  separatorBuilder: (context, index) => SizedBox(width: 32.0),
                ),
              Spacer(),
              if(!isMobile) SeparatedRow(
                children: [
                  SvgPicture.asset(Assets.icons.search),
                  SvgPicture.asset(Assets.icons.profile),
                  LanguageDropdown(),
                ],
                separatorBuilder: (context, index) => SizedBox(width: 27.0),
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainScreen(),
            GalleryScreen(),
            ExpeditionsScreen(),
            PatronsClubScreen(),
          ],
        ),
      ),
    );
  }
}
