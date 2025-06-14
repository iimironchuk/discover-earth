import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/expeditions_screen/widgets/expedition_tile.dart';
import 'package:discover_earth/screens/expeditions_screen/widgets/upcoming_expedition_tile.dart';
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

  final upcomingExpeditions = [
    UpcomingExpeditionTile(
      title: 'Bhutanese Highlands',
      date: 'October 2025',
      description:
          'Sacred monasteries and untouched mountain ecosystems in the world`s most carbon-negative country.',
    ),
    UpcomingExpeditionTile(
      title: 'New Zealand Fiordlands',
      date: 'November 2025',
      description:
          'Ancient rainforests and pristine fjords with Māori cultural immersion and conservation initiatives.',
    ),
    UpcomingExpeditionTile(
      title: 'Madagascar Rainforests',
      date: 'January 2026',
      description:
          'Encounter unique endemic species and support critical conservation efforts in biodiversity hotspots.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundGray,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical:
                isMobile
                    ? 20.0
                    : isTablet
                    ? 40.0
                    : 80.0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1536.0),
              child: Column(
                children: [
                  Text(
                    'Invite-Only Eco-Expeditions',
                    style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.mainGreen,
                      fontSize:
                          !smallerThanDesktop
                              ? isMobile
                                  ? 20.0
                                  : 48.0
                              : 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
                    child: SizedBox(
                      width: 600.0,
                      child: Text(
                        'Join our exclusive journeys to Earth`s most pristine and sacred locations, guided by renowned naturalists and indigenous wisdom keepers.',
                        style: textTheme.labelMedium!.copyWith(
                          fontSize:
                              smallerThanDesktop
                                  ? 16.0
                                  : isMobile
                                  ? 12.0
                                  : 18.0,
                          color: AppColors.mainText,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWideEnough = constraints.maxWidth >= 1100;

                      if (isWideEnough) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              expeditionsList
                                  .map(
                                    (tile) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: tile,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        );
                      } else {
                        return SizedBox(
                          height: 500,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.85),
                            itemCount: expeditionsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: expeditionsList[index],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 64.0, bottom: 32.0),
                    child: Text(
                      'Upcoming Expeditions',
                      style: textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.mainGreen,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  // Wrap(children: upcomingExpeditions),
                  smallerThanLaptop
                      ? SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.85),
                          itemCount: upcomingExpeditions.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: upcomingExpeditions[index],
                            );
                          },
                        ),
                      )
                      : Row(
                        children: [
                          ...upcomingExpeditions.map(
                            (expedition) => Expanded(child: expedition),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
