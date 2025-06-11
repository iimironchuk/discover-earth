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

  Widget _buildTitleContent(TextTheme textTheme, bool smallerThanTablet) {
    final children = <Widget>[
      Text(
        expeditionTitle,
        style: textTheme.titleMedium!.copyWith(
          fontSize: smallerThanTablet ? 16.0 : 24.0,
        ),
      ),
      !smallerThanTablet ? Spacer() : SizedBox(),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
              width: smallerThanTablet ? 8.0 : 12.0,
              height: smallerThanTablet ? 8.0 : 12.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainSand,
              ),
            ),
          ),
          Text(
            'Accepting Applications',
            style: textTheme.labelMedium!.copyWith(fontSize: smallerThanTablet ? 10.0 : 14.0),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ];

    return smallerThanTablet
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    )
        : Row(children: children);
  }

  Widget _buildAdditionalInfoContent(
      TextTheme textTheme,
      bool smallerThanTablet,
      ) {
    final children = <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.lightText,
              fontSize: smallerThanTablet ? 10 : 14.0,
            ),
          ),
          SizedBox(height: smallerThanTablet ? 0 : 4.0),
          Text(
            'Group Size: $groupSize Patrons',
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.lightText,
              fontSize: smallerThanTablet ? 10 : 14.0,
            ),
          ),
        ],
      ),
      !smallerThanTablet ? Spacer() : SizedBox(),
      Padding(
        padding: EdgeInsets.only(top: smallerThanTablet ? 8.0 : 0),
        child: SizedBox(
          width: smallerThanTablet ? 120.0 : 178.0,
          height: smallerThanTablet ? 20.0 : 36.0,
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

    return smallerThanTablet
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
    final smallerThanTablet = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    final smallerThanLaptop = ResponsiveBreakpoints.of(context).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      // child: AspectRatio(
      //   aspectRatio: 716 / 600,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          height: 522.0,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: image.provider(),
                          fit: BoxFit.cover,
                        ),
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
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffold,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(!smallerThanDesktop ? 32.0 : smallerThanTablet ? 8.0 : 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleContent(textTheme, smallerThanLaptop),
                        Padding(
                          padding: EdgeInsets.only(
                            top: smallerThanTablet ? 8.0 : 18.0,
                            bottom: smallerThanTablet ? 10.0 : 20.0,
                          ),
                          child: Text(
                            description,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: smallerThanLaptop ? 12.0 : 16.0,
                            ),
                          ),
                        ),
                        _buildAdditionalInfoContent(textTheme, smallerThanLaptop),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}
