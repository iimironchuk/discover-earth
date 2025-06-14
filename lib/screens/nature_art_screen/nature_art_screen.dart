import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/nature_art_screen/widgets/nature_art_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class NatureArtScreen extends StatelessWidget {
  NatureArtScreen({super.key});

  final List<Widget> _artTilesList = [
    NatureArtTile(
      image: Assets.images.natureArt1,
      title: 'Coral Resonance',
      authorImage: Assets.images.author1,
      description:
          'An immersive digital representation of the Great Barrier Reef`s vibrant ecosystem, with proceeds supporting coral restoration initiatives.',
      price: 8.5,
      currentEdition: 3,
      editionsNumber: 10,
      authorName: 'By Maya Chen',
    ),
    NatureArtTile(
      image: Assets.images.natureArt2,
      title: 'Ancient Whispers',
      authorImage: Assets.images.author2,
      description:
          'A meditative exploration of ancient redwood forests, capturing the timeless wisdom and quiet majesty of these endangered giants.',
      price: 12.2,
      currentEdition: 2,
      editionsNumber: 7,
      authorName: 'By James Thornton',
    ),
    NatureArtTile(
      image: Assets.images.natureArt3,
      title: 'Aurora Eternal',
      authorImage: Assets.images.author3,
      description:
          'A dynamic digital interpretation of the Arctic`s aurora borealis, with proceeds supporting indigenous-led conservation initiatives.',
      currentEdition: 1,
      editionsNumber: 5,
      authorName: 'By James Thornton',
      price: 15.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return Container(
      width: double.infinity,
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
                  'Digital Nature Art Vault',
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
                      'Limited edition digital masterpieces by renowned nature artists, with AR enhancement capabilities and conservation impact tracking.',
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
                      height: 512.0,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: _artTilesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 470.0,
                                child: _artTilesList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : SizedBox(
                      height: 512.0,
                      child: Row(
                        children: [
                          ..._artTilesList.map(
                            (expedition) => Expanded(child: expedition),
                          ),
                        ],
                      ),
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
                        'Explore Full Collection',
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
