import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/gallery_screen/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<Widget> imageGallery = [
    Assets.images.img1.image(),
    Assets.images.img2.image(),
    Assets.images.img3.image(),
    Assets.images.img4.image(),
    Assets.images.img5.image(),
    Assets.images.img6.image(),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThatDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return Container(
      color: AppColors.scaffold,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallerThatDesktop ? 30.0 : 10.0,
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
              // mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 1 / 15),
                Text(
                  'Living Gallery',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.mainGreen,
                    fontSize: smallerThatDesktop ? 34.0 : 48.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
                  child: SizedBox(
                    width: 600.0,
                    child: Text(
                      'Immerse yourself in Earth`s most breathtaking landscapes through full-screen films and 3D audio experiences.',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: smallerThatDesktop ? 14.0 : 18.0,
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
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: smallerThatDesktop ? 2 : 3,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 474.0 / 384.0,
                  ),
                  itemCount: imageGallery.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final image = imageGallery[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: image,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: CustomOutlinedButton(),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 1 / 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
