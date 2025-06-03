import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainText),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'View All Experiences',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
