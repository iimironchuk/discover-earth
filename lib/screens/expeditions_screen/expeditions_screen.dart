import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/expeditions_screen/widgets/expedition_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class ExpeditionsScreen extends StatelessWidget {
  ExpeditionsScreen({super.key});

  final expeditionsList = [
    ExpeditionTile(
      expeditionTitle: 'Patagonian Wilderness',
      date: 'September 15-26, 2025',
      groupSize: 8,
      description:
          'A 12-day immersive journey through the pristine landscapes of Torres del Paine and the remote Aysen region, guided by local conservationists and photographers.',
      image: Assets.images.expedition1,
    ),
    ExpeditionTile(
      expeditionTitle: 'Mongolian Steppes',
      date: 'July 5-14, 2025',
      groupSize: 6,
      description:
          'A 10-day nomadic journey across the vast Mongolian steppes, connecting with traditional herders and experiencing one of Earth`s last great wilderness areas.',
      image: Assets.images.expedition2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 1 / 15),
          Text(
            'Invite-Only Eco-Expeditions',
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.mainGreen,
              fontSize: 48.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
            child: SizedBox(
              width: 600.0,
              child: Text(
                'Join our exclusive journeys to Earth`s most pristine and sacred locations, guided by renowned naturalists and indigenous wisdom keepers.',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: 18.0,
                  color: AppColors.mainText,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          Wrap(children: expeditionsList,),
          SizedBox(height: 64),
        ],
      ),
    );
  }
}
