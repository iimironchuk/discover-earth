import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CommunityTextField extends StatelessWidget {
  const CommunityTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      // width: 361.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.scaffold,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Your email address',
            hintStyle: textTheme.labelMedium!.copyWith(
              fontSize: isMobile ? 12.0 :  16.0,
              fontWeight: FontWeight.w500,
              color: AppColors.mainText.withValues(alpha: 0.5),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
