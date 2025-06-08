import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String text;

  const CustomCheckbox({super.key, required this.value, required this.text});

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 1472).clamp(0.7, 1.0);
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: AppColors.mainSand),
          activeColor: AppColors.mainSand,
          value: value,
          onChanged: (check) {},
        ),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14.0 *scaleFactor,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
