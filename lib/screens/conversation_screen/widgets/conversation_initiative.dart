import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConversationInitiative extends StatelessWidget {
  final String title;
  final String description;
  final double countRaised;
  final double countGoal;

  const ConversationInitiative({
    super.key,
    required this.title,
    required this.description,
    required this.countRaised,
    required this.countGoal,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 600).clamp(0.7, 1.0);
    final progress = (countRaised / countGoal).clamp(0.0, 1.0);
    final smallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return AspectRatio(
      aspectRatio: 600.0 / 200.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              Assets.icons.conversationItem,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 16.0 * scaleFactor),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium!.copyWith(
                    fontSize:smallerThanDesktop ? 15.0 : 20.0,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: smallerThanDesktop ? 4.0 : 9.0, bottom: smallerThanDesktop ? 6.0 : 13.0),
                  child: Text(
                    description,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: smallerThanDesktop ? 10.0 : 14.0,
                    ),
                    softWrap: false,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8.0,
                      backgroundColor: AppColors.lightGrey,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainSand),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$countRaised raised',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: smallerThanDesktop ? 8.0 : 12.0,
                      ),
                    ),
                    Text(
                      '\$$countGoal goal',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize:  smallerThanDesktop ? 8.0 : 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
