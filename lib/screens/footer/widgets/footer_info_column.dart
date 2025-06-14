import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterInfoColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterInfoColumn({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanLaptop = ResponsiveBreakpoints.of(context).smallerThan('Laptop');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium!.copyWith(fontSize: 18.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  item,
                  style: textTheme.labelMedium!.copyWith(fontSize: smallerThanLaptop ? 12.0 : 16.0),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
