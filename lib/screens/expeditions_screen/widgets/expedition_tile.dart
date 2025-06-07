import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ExpeditionTile extends StatelessWidget {
  final String expeditionTitle;
  final String date;
  final String description;
  final int groupSize;
  final AssetGenImage image;

  const ExpeditionTile({
    super.key,
    required this.expeditionTitle,
    required this.date,
    required this.groupSize,
    required this.description,
    required this.image,
  });

  Widget _buildTitleContent(TextTheme textTheme, bool smallerThanDesktop) {
    final children = <Widget>[
      Text(
        expeditionTitle,
        style: textTheme.titleMedium!.copyWith(
          fontSize: smallerThanDesktop ? 16.0 : 24.0,
        ),
      ),
      !smallerThanDesktop ? Spacer() : SizedBox(),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
              width: smallerThanDesktop ? 8.0 : 12.0,
              height: smallerThanDesktop ? 8.0 : 12.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainSand,
              ),
            ),
          ),
          Text(
            'Accepting Applications',
            style: textTheme.labelMedium!.copyWith(fontSize: smallerThanDesktop ? 10.0 : 14.0),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ];

    return smallerThanDesktop
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )
        : Row(children: children);
  }

  Widget _buildAdditionalInfoContent(
    TextTheme textTheme,
    bool smallerThanDesktop,
  ) {
    final children = <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.lightText,
              fontSize: smallerThanDesktop ? 10 : 14.0,
            ),
          ),
          SizedBox(height: smallerThanDesktop ? 0 : 4.0),
          Text(
            'Group Size: $groupSize Patrons',
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.lightText,
              fontSize: smallerThanDesktop ? 10 : 14.0,
            ),
          ),
        ],
      ),
      !smallerThanDesktop ? Spacer() : SizedBox(),
      Padding(
        padding: EdgeInsets.only(top: smallerThanDesktop ? 8.0 : 0),
        child: SizedBox(
          width: smallerThanDesktop ? 120.0 : 178.0,
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
                'Request Invitation',
                style: textTheme.labelMedium!.copyWith(
                  color: AppColors.scaffold,
                ),
              ),
            ),
          ),
        ),
      ),
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
    final double tileHeight = 570.0;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: AspectRatio(
        aspectRatio: 716 / 572,
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
                    color: AppColors.mainSand,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'Limited Spaces',
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.scaffold,
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
                    padding: EdgeInsets.all(!smallerThanDesktop ? isMobile ? 8.0 : 32.0  : 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleContent(textTheme, smallerThanDesktop),
                        Padding(
                          padding:  EdgeInsets.only(
                            top: smallerThanDesktop ? 10.0 :  18.0,
                            bottom: smallerThanDesktop ? 12.0 : 20.0,
                          ),
                          child: Text(
                            description,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: smallerThanDesktop ? 10.0 : 16.0,
                            ),
                          ),
                        ),
                        _buildAdditionalInfoContent(
                          textTheme,
                          smallerThanDesktop,
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
