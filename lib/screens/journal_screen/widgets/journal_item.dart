import 'package:discover_earth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';
import '../../nature_art_screen/widgets/circle.dart';

class JournalItem extends StatelessWidget {
  final AssetGenImage image;
  final AssetGenImage authorImage;
  final String title;
  final String journalType;
  final String date;
  final String description;
  final String authorName;

  const JournalItem({
    super.key,
    required this.image,
    required this.authorImage,
    required this.title,
    required this.journalType,
    required this.date,
    required this.description,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');

    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 469.0).clamp(0.7, 1.0);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15.0 : 20.0,
        vertical: 10.0,
      ),
      child: AspectRatio(
        aspectRatio: 469.0 / 512.0,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          // width: 600.0,
          // height: tileHeight,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: image.image(fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                // height: 250.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffold,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      !smallerThanDesktop
                          ? isMobile
                              ? 8.0
                              : 24.0
                          : 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              journalType,
                              style: textTheme.labelMedium!.copyWith(
                                fontSize: smallerThanLaptop ? 9.0 : 12.0,
                                color: AppColors.mainText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: Icon(
                                Icons.circle,
                                size: 4.0,
                                color: AppColors.mainText,
                              ),
                            ),
                            Text(
                              date,
                              style: textTheme.labelMedium!.copyWith(
                                fontSize: smallerThanLaptop ? 9.0 : 12.0,
                                color: AppColors.mainText,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          title,
                          style: textTheme.titleMedium!.copyWith(
                            fontSize: smallerThanDesktop ? 14.0 : 20.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: smallerThanDesktop ? 10.0 : 18.0,
                            bottom: smallerThanDesktop ? 12.0 : 20.0,
                          ),
                          child: Text(
                            description,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: smallerThanDesktop ? 10.0 : 16.0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 32.0 * scaleFactor,
                              width: 32.0 * scaleFactor,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: authorImage.provider(),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                authorName,
                                style: textTheme.labelMedium!.copyWith(
                                  fontSize: 14.0 * scaleFactor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),

                            Spacer(),
                            Container(
                              width: 78.0 *scaleFactor,
                              height: 38.0 * scaleFactor,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.mainGreen),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Read',
                                  style: textTheme.labelMedium!.copyWith(
                                      color: AppColors.mainGreen,
                                      fontWeight: FontWeight.w600,
                                    fontSize: 14.0 * scaleFactor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
