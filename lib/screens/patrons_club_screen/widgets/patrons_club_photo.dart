import 'package:discover_earth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class PatronsClubPhoto extends StatelessWidget {
  const PatronsClubPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    const maxWidth = 704.0;
    const imageHeight = 520.0;

    final scaleFactor = (screenWidth / maxWidth).clamp(0.7, 1.0);
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Center(
      child: AspectRatio(
        aspectRatio: maxWidth / imageHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: Assets.images.patronsClub.image(fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FractionallySizedBox(
                widthFactor: isMobile ? 0.7 : 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16 * scaleFactor),
                    color: AppColors.scaffold,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.mainText.withOpacity(0.5),
                        offset: Offset(5 * scaleFactor, 5 * scaleFactor),
                        blurRadius: 110 * scaleFactor,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0 * scaleFactor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40.0 * scaleFactor,
                              height: 40.0 * scaleFactor,
                              child: ClipOval(
                                child: Assets.images.drImage.image(),
                              ),
                            ),
                            SizedBox(width: 12.0 * scaleFactor),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dr. Eleanor Harrington',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontSize: 18.0 * scaleFactor,
                                      // smallerThanDesktop
                                      //     ? 14
                                      //     : isMobile
                                      //     ? 10.0
                                      //     : 18.0,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Founding Patron',
                                    style: textTheme.labelMedium!.copyWith(
                                      fontSize: 14.0 * scaleFactor,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 17.0 * scaleFactor),
                        Text(
                          '"Our collective commitment to these sacred spaces creates a legacy that will endure for generations. This is philanthropy with profound purpose."',
                          style: textTheme.labelMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0 * scaleFactor,
                          ),
                          softWrap: true,
                          overflow: isMobile ? TextOverflow.ellipsis : TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
