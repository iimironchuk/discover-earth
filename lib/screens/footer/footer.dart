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
    return Container(
      color: AppColors.scaffold,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical:
              isMobile
                  ? 20.0
                  : isTablet
                  ? 40.0
                  : 80.0,
          horizontal: smallerThanDesktop ? 30.0 : 10.0,
        ),
        child: Center(
          // alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1536.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
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

                    Padding(
                      padding: EdgeInsets.only(
                        right: smallerThanLaptop ? 100.0 : 170.0,
                        top: smallerThanLaptop ? 15.0 : 0,
                      ),
                      child: FooterInfoColumn(
                        title: 'Explore',
                        items: exploreItems,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: smallerThanLaptop ? 100.0 : 150.0,
                        top: smallerThanLaptop ? 15.0 : 0,
                      ),
                      child: FooterInfoColumn(
                        title: 'Information',
                        items: infoItems,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: smallerThanLaptop ? 15.0 : 0,
                          right: smallerThanLaptop ? 100.0 : 150.0
                      ),
                      child: FooterInfoColumn(
                        title: 'Legal',
                        items: legalItems,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
                  child: Divider(color: AppColors.lightGrey),
                ),
                smallerThanLaptop
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
