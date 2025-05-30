import 'package:flutter/material.dart';

class HeaderLabel extends StatelessWidget {
  final String title;

  const HeaderLabel({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelMedium,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
