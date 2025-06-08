import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';
import 'custom_checkbox.dart';

class PropertiesColumn extends StatelessWidget {
  const PropertiesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final textTheme = Theme.of(context).textTheme;
    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 1472).clamp(0.7, 1.0);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(smallerThanLaptop ? 8.0 : 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Sanctuaries',
                style: textTheme.titleMedium!.copyWith(
                  fontSize: 20.0 * scaleFactor,
                ),
              ),
              CustomCheckbox(
                value: false,
                text: 'Rainforest Retreats',
              ),
              CustomCheckbox(
                value: true,
                text: 'Coastal Sanctuaries',
              ),
              CustomCheckbox(value: true, text: 'Mountain Havens'),
              CustomCheckbox(value: false, text: 'Desert Oases'),
              CustomCheckbox(value: false, text: 'Private Islands'),
              Divider(color: AppColors.lightGrey),
              Text(
                'Conservation Status',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: 12.0 * scaleFactor,
                  color: AppColors.mainText,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(
                  context,
                ).copyWith(trackHeight: 1.0),
                child: Slider(
                  padding: EdgeInsets.zero,
                  activeColor: AppColors.mainSand,
                  inactiveColor: AppColors.mainSand.withValues(
                    alpha: 0.8,
                  ),
                  value: 0.8,
                  onChanged: (value) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 12.0 * scaleFactor,
                    ),
                  ),
                  Text(
                    'Protected Areas Only',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 12.0 * scaleFactor,
                    ),
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
