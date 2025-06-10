import 'package:flutter/material.dart';

class HeaderLabel extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const HeaderLabel({super.key, required this.title, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
