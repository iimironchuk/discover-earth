import 'package:discover_earth/screens/patrons_club_screen/widgets/patrons_club_info_column.dart';
import 'package:discover_earth/screens/patrons_club_screen/widgets/patrons_club_photo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class PatronsClubScreen extends StatelessWidget {
  const PatronsClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = MediaQuery.of(context).size.height;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Container(color: AppColors.scaffold,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1536.0
          ),
          child: smallerThanDesktop ? Column(
            children: [
              PatronsClubInfoColumn(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: PatronsClubPhoto(),
              )
            ],
          ) : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: PatronsClubInfoColumn()
              ),
              const SizedBox(width: 40.0),
              Expanded(flex: 1, child: PatronsClubPhoto()),
            ],
          ),
        ),
      ),
    );
  }
}
