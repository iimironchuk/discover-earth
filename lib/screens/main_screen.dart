import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget _buildInteractiveContent(
    TextTheme textTheme,
    bool smallerThanDesktop,
  ) {
    final children = <Widget>[
      SizedBox(
        width: 200.0,
        height: 44.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text('Begin Your Journey'),
        ),
      ),
      SizedBox(width: 24.0, height: 24.0),
      Row(
        children: [
          Switch(
            value: true,
            onChanged: (isOn) {},
            activeColor: AppColors.scaffold,
            activeTrackColor: AppColors.mainSand,
          ),
          SizedBox(width: 12.0),

          Text(
            'Ambient Sound',
            style: textTheme.labelMedium!.copyWith(
              color: AppColors.scaffold,
              fontSize: 14.0,
            ),
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

  @override
  Widget build(BuildContext context) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final textTheme = Theme.of(context).textTheme;
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return SizedBox(
      width: double.infinity,
      height:
          !smallerThanLaptop ? MediaQuery.of(context).size.height - 68 : null,
      child: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.mainImage.image(fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainGreen.withValues(alpha: 0.8),
                    AppColors.mainGreen.withValues(alpha: 0.4),
                    AppColors.mainGreen.withValues(alpha: 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:  EdgeInsets.only(left: smallerThanLaptop  ? 50.0 : 224.0),
              child: Container(
                // alignment: Alignment.bottomRight,
                constraints: BoxConstraints(maxWidth: 672.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Discover Earth`s Most\nSacred Sanctuaries',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize:
                            !smallerThanDesktop
                                ? isMobile
                                    ? 30.0
                                    : 72.0
                                : 48.0,
                        color: AppColors.scaffold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 26.0,
                        bottom: 42.0,
                        right: MediaQuery.of(context).size.width * 1 / 8,
                      ),
                      child: SizedBox(
                        width: 500.0,
                        child: Text(
                          'An immersive journey into the world`s most untouched natural wonders, curated for those who seek the extraordinary.',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize:
                                !isTablet
                                    ? isMobile
                                        ? 15.0
                                        : 20
                                    : 18.0,
                            fontWeight: FontWeight.w300,
                            color: AppColors.scaffold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    _buildInteractiveContent(textTheme, smallerThanDesktop),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
