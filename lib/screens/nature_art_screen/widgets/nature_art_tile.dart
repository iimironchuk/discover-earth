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
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        width: 469.0,
        // height: tileHeight,
        child: Column(
          children: [
            SizedBox(
              height: 224.0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                child: SizedBox.expand(child: image.image(fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  // color: AppColors.scaffold,
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
                              // fontSize: smallerThanLaptop ? 9.0 : 12.0,
                              fontSize: 20.0 * scaleFactor,
                              color: AppColors.mainText,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Circle(),
                              SizedBox(width: 4.0),
                              Circle(),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, bottom: 17.0),
                        child: Row(
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: smallerThanDesktop ? 8.0 : 13.0,
                          bottom: smallerThanDesktop ? 12.0 : 20.0,
                        ),
                        child: Text(
                          description,
                          style: textTheme.labelMedium!.copyWith(
                            // fontSize: smallerThanDesktop ? 10.0 : 14.0,
                            fontSize: 14.0 * scaleFactor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$price ETH',
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: 16.0 * scaleFactor,
                              color: AppColors.mainSand,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: AppColors.mainGreen,
                            ),
                            onPressed: () {},
                            child: Text('View Details'),
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
    );
  }
}
