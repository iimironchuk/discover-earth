import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/app_colors.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      width: isMobile ? 24.0 : 32.0,
      height: isMobile ? 24.0 : 32.0,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(Assets.icons.circle, fit: BoxFit.scaleDown),
    );
  }
}
