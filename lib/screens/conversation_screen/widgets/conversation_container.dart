import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConversationContainer extends StatelessWidget {
  final String image;
  final String count;
  final String description;

  const ConversationContainer({
    super.key,
    required this.image,
    required this.count,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 344).clamp(0.7, 1.0);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return Container(
      width: 344.0,
      height: 224.0,
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: smallerThanLaptop ? 40.0 : 64.0,
            height: smallerThanLaptop ? 40.0 : 64.0,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
            child: Text(
              count,
              style: textTheme.titleMedium!.copyWith(
                fontSize: smallerThanLaptop ? 24.0 :36.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Text(
            description,
            style: textTheme.labelMedium!.copyWith(
              fontSize: smallerThanLaptop ? 10.0 : 16.0 ,
            ),
          ),
        ],
      ),
    );
  }
}
