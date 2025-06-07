import 'package:discover_earth/screens/patrons_club_screen/widgets/patrons_club_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class PatronsClubInfoColumn extends StatelessWidget {
  const PatronsClubInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 1 / 15),
        Text(
          'Nature Patrons Club',
          style: textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w300,
            color: AppColors.mainGreen,
            fontSize: smallerThanLaptop ? 32.0 : 48.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 27.0, bottom: 37.0),
          child: Text(
            'An exclusive circle of visionaries committed to preserving Earth`s most sacred natural spaces through strategic philanthropy and conscious stewardship.',
            style: textTheme.labelMedium!.copyWith(
              fontSize: smallerThanLaptop ? 14.0 : 18.0,
              color: AppColors.mainText,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),

        PatronsClubListTile(
          title: 'Direct Conservation Impact',
          subtitle:
              'Your membership directly funds the preservation of critical habitats and endangered species through our network of conservation partners.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 27.0),
          child: PatronsClubListTile(
            title: 'Exclusive Access',
            subtitle:
                'Priority invitations to our limited eco-expeditions, private viewings of the Art Vault, and personal connections with leading conservationists.',
          ),
        ),
        PatronsClubListTile(
          title: 'Legacy Creation',
          subtitle:
              'Opportunities to create lasting conservation legacies through named initiatives and long-term preservation projects.',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: SizedBox(
            width: 300.0,
            height: 44.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text('Request Membership Information'),
            ),
          ),
        ),
      ],
    );
  }
}
