import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/nature_art_screen/widgets/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class NatureArtTile extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final AssetGenImage authorImage;
  final String authorName;
  final String description;
  final double price;
  final int currentEdition;
  final int editionsNumber;

  const NatureArtTile({
    super.key,
    required this.image,
    required this.title,
    required this.authorImage,
    required this.description,
    required this.price,
    required this.currentEdition,
    required this.editionsNumber,
    required this.authorName,
  });

  Widget _buildTitleContent(TextTheme textTheme, bool smallerThanDesktop) {
    final children = <Widget>[
      Text(
        title,
        style: textTheme.titleMedium!.copyWith(
          fontSize: smallerThanDesktop ? 14.0 : 20.0,
        ),
      ),
      !smallerThanDesktop ? Spacer() : SizedBox(),
      Row(children: [Circle(), SizedBox(width: 8.0), Circle()]),
    ];

    return smallerThanDesktop
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )
        : Row(children: children);
  }

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
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: isMobile ? 15.0 : 20.0, vertical: 10.0),
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
                top: 16.0,
                right: 16.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.scaffold.withValues(alpha: 0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'Edition $currentEdition of $editionsNumber',
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.mainGreen,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
                              title,
                              style: textTheme.titleMedium!.copyWith(
                                fontSize: smallerThanDesktop ? 14.0 : 20.0,
                              ),
                            ),
                            Spacer(),
                            // !smallerThanDesktop ? Spacer() : SizedBox(),
                            Row(
                              children: [
                                Circle(),
                                SizedBox(width: smallerThanLaptop ?  0 : 8.0),
                                Circle(),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 32.0,
                              width: 32.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: authorImage.provider(),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Text(
                              authorName,
                              style: textTheme.labelMedium!.copyWith(
                                fontSize: smallerThanDesktop ? 10.0 : 14.0,
                              ),
                            ),
                          ],
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
                            Text(
                              '$price ETH',
                              style: textTheme.labelMedium!.copyWith(
                                fontSize: smallerThanDesktop ? 12.0 : 16.0,
                                color: AppColors.mainSand,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: smallerThanDesktop ? 90.0 : 127.0,
                              height: smallerThanDesktop ? 20.0 : 36.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'View Details',
                                    style: textTheme.labelMedium!.copyWith(
                                      color: AppColors.scaffold,
                                    ),
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
