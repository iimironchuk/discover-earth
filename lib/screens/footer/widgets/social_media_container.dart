import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaContainer extends StatelessWidget {
  final String image;
  const SocialMediaContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(image, fit: BoxFit.scaleDown,),
    );
  }
}
