import 'package:discover_earth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class UpcomingExpeditionTile extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  const UpcomingExpeditionTile({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 474.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.scaffold,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleMedium!.copyWith(
                          fontSize: smallerThanDesktop ? 15.0 : 20.0,
                        ),
                      ),
                      Text(
                        date,
                        style: textTheme.labelMedium!.copyWith(
                          color: AppColors.lightText,
                          fontSize: smallerThanDesktop ? 10.0 : 14.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: smallerThanDesktop ? 20.0 : 40.0,
                    height: smallerThanDesktop ? 20.0 : 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightGrey,
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.ring,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17.0),
                child: Text(
                  description,
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: smallerThanDesktop ? 10.0 : 14.0,
                  ),
                ),
              ),
              SizedBox(
                height: smallerThanDesktop ? 20.0 : 38.0,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightText),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Join Waitlist',
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
