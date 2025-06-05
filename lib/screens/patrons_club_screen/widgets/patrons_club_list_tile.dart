import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatronsClubListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const PatronsClubListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 23.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 12.0,
              ),
              child: SvgPicture.asset(Assets.icons.tick, fit: BoxFit.scaleDown),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium!.copyWith(
                  fontSize: 20.0,
                  color: Color(0xFF111827),
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                subtitle,
                style: textTheme.labelMedium!.copyWith(fontSize: 16.0),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
