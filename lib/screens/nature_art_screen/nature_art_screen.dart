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
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final fullHeight = MediaQuery.of(context).size.height;
    final fullWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.backgroundGray,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fullWidth * 1 / 8,
            vertical: fullHeight * 1 / 15,
          ),
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
                itemCount: _artTilesList.length,
                itemBuilder: (context, index) {
                  return _artTilesList[index];
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
                      'Explore Full Collection',
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.mainGreen,
                        fontWeight: FontWeight.w600
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
