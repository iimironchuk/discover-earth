import 'package:discover_earth/screens/map_screen/widgets/map_with_properties.dart';
import 'package:discover_earth/screens/map_screen/widgets/map_with_properties_row.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundGray,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fullWidth * 1 / 8,
            vertical: fullHeight * 1 / 15,
          ),
          child: Column(
            children: [
              Text(
                'Wild Luxury Retreats',
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.mainGreen,
                  fontSize: smallerThanDesktop ? 34.0 : 48.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
                child: SizedBox(
                  width: 600.0,
                  child: Text(
                    'Discover our curated collection of the world`s most exclusive eco- sanctuaries, where unparalleled luxury meets untouched wilderness.',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: smallerThanDesktop ? 14.0 : 18.0,
                      color: AppColors.mainText,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              isMobile ? MapWithPropertiesRow() : MapWithProperties(),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Request Retreat Catalog'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
