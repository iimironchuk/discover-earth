import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/journal_screen/widgets/journal_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';
import '../nature_art_screen/widgets/nature_art_tile.dart';

class JournalScreen extends StatelessWidget {
  JournalScreen({super.key});

  final List<Widget> _journalsList = [
    JournalItem(
      image: Assets.images.journal1,
      authorImage: Assets.images.journalAuthor1,
      title:
          'The Sacred Relationship: Indigenous Perspectives on Nature`s Balance',
      journalType: 'Indigenous Voices',
      date: 'April 8, 2025',
      description:
          'Elder Mateo Santana shares ancient wisdom on the reciprocal relationship between humans and the natural world, offering insights into sustainable coexistence.',
      authorName: 'By Mateo Santana',
    ),
    JournalItem(
      image: Assets.images.journal2,
      authorImage: Assets.images.journalAuthor2,
      title: 'The Patience of Seeing: Capturing Earth`s Fleeting Moments',
      journalType: 'Photography',
      date: 'April 5, 2025',
      description:
          'Award-winning photographer Sophia Lin discusses the meditative practice of nature photography and the profound moments of connection it creates.',
      authorName: 'By Sophia Lin',
    ),
    JournalItem(
      image: Assets.images.journal3,
      authorImage: Assets.images.journalAuthor3,
      title: 'Coral Renaissance: The Science and Soul of Reef Restoration',
      journalType: 'Conservation',
      date: 'April 2, 2025',
      description:
          'Marine biologist Dr. Marcus Trent explores innovative approaches to coral reef restoration and the emotional journey of witnessing ecosystem rebirth.',
      authorName: 'By Dr. Marcus Trent',
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
    return Container(
      width: double.infinity,
      color: AppColors.scaffold,
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
                  'The Reverie Journal',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.mainGreen,
                    fontSize: smallerThanDesktop ? 34.0 : 48.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
                  child: SizedBox(
                    width: 600.0,
                    child: Text(
                      'Thoughtful explorations of the sacred, silent, and sublime in nature, written by renowned naturalists, indigenous wisdom keepers, and visionary photographers.',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: smallerThanDesktop ? 14.0 : 18.0,
                        color: AppColors.mainText,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
                smallerThanDesktop
                    ? SizedBox(
                      height: 486.0,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: _journalsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 470.0,
                                child: _journalsList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : SizedBox(
                      height: 486.0,
                      child: Row(
                        children: [
                          ..._journalsList.map(
                            (expedition) => Expanded(child: expedition),
                          ),
                        ],
                      ),
                    ),
                Padding(
                  padding: EdgeInsets.only(
                    top: smallerThanLaptop ? 24.0 : 48.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.mainGreen),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All Articles',
                        style: textTheme.labelMedium!.copyWith(
                          color: AppColors.mainGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
