import 'package:discover_earth/screens/patrons_club_screen/widgets/patrons_club_info_column.dart';
import 'package:discover_earth/screens/patrons_club_screen/widgets/patrons_club_photo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class PatronsClubScreen extends StatelessWidget {
  const PatronsClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Container(
      color: AppColors.scaffold,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallerThanDesktop ? 30.0 : 10.0,
          vertical:
              isMobile
                  ? 20.0
                  : isTablet
                  ? 40.0
                  : 80.0,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1536.0),
            child:
                smallerThanDesktop
                    ? Column(
                      children: [
                        PatronsClubInfoColumn(),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: PatronsClubPhoto(),
                        ),
                      ],
                    )
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: PatronsClubInfoColumn()),
                        const SizedBox(width: 40.0),
                        Expanded(flex: 1, child: PatronsClubPhoto()),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
