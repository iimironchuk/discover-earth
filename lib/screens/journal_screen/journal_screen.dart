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
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.scaffold,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fullWidth * 1 / 8,
            vertical: fullHeight * 1 / 15,
          ),
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
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      !smallerThanLaptop
                          ? smallerThanDesktop
                              ? 2
                              : 3
                          : 1,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 24.0,
                  childAspectRatio: 470.0 / 512.0,
                ),
                itemCount: _journalsList.length,
                itemBuilder: (context, index) {
                  return _journalsList[index];
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
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
    );
  }
}
