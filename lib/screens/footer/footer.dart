import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/footer/widgets/footer_info_column.dart';
import 'package:discover_earth/screens/footer/widgets/social_media_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final images = [
    Assets.icons.instagram,
    Assets.icons.x,
    Assets.icons.linkedin,
    Assets.icons.youtube,
  ];

  final paymentItems = [
    Assets.icons.visa,
    Assets.icons.mastercard,
    Assets.icons.paypal,
    Assets.icons.apple,
  ];

  final exploreItems = [
    'Living Gallery',
    'Eco-Expeditions',
    'Nature Patrons Club',
    'Digital Art Vault',
    'Reverie Journal',
  ];

  final infoItems = [
    'About Us',
    'Conservation Partners',
    'Impact Reports',
    'Press & Media',
    'Contact Us',
  ];

  final legalItems = [
    'Privacy Policy',
    'Terms of Service',
    'Cookie Policy',
    'Ethical Guidelines',
    'Accessibility',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.scaffold,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fullWidth * 1 / 10,
            vertical: fullHeight * 1 / 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      isMobile
                          ? 1
                          : isTablet
                          ? 2
                          : 4,
                  childAspectRatio: 330.0 / 300.0,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Eden Reverie',
                            style: textTheme.bodyMedium!.copyWith(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 25.0,
                            ),
                            child: SizedBox(
                              width: 300.0,
                              child: Text(
                                'A digital sanctuary celebrating Earth`s most sacred natural spaces through immersive experiences and conscious stewardship.',
                                style: textTheme.labelMedium,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...images.map((image) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                      ),
                                      child: SocialMediaContainer(
                                        image: image,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  FooterInfoColumn(title: 'Explore', items: exploreItems),
                  FooterInfoColumn(title: 'Information', items: infoItems),
                  FooterInfoColumn(title: 'Legal', items: legalItems),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
                child: Divider(color: AppColors.lightGrey),
              ),
              smallerThanLaptop
                  ? Column(
                    children: [
                      Text(
                        '© 2025 Eden Reverie. All rights reserved.',
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainText.withValues(alpha: 0.5),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          ...paymentItems.map((image) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13.0,
                              ),
                              child: SvgPicture.asset(
                                image,
                                fit: BoxFit.scaleDown,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Text(
                        '© 2025 Eden Reverie. All rights reserved.',
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainText.withValues(alpha: 0.5),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          ...paymentItems.map((image) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13.0,
                              ),
                              child: SvgPicture.asset(
                                image,
                                fit: BoxFit.scaleDown,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
