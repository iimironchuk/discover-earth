import 'package:discover_earth/screens/community_screen/widgets/community_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

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
      color: AppColors.backgroundGray,
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
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 768.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Join Our Community',
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
                      'Subscribe to receive curated insights from our journal, invitations to exclusive events, and updates on our conservation initiatives.',
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
                SizedBox(
                  width: 512.0,
                  child: Row(
                    children: [
                      Expanded(child: CommunityTextField()),
                      SizedBox(width: 16.0),
                      SizedBox(
                        width: 135.0,
                        height: 44.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Subscribe'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'By subscribing, you agree to our Privacy Policy and consent to receive updates from Eden Reverie.',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: smallerThanLaptop ? 11.0 : 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
