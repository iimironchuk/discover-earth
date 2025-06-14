import 'package:discover_earth/screens/conversation_screen/widgets/conversation_container.dart';
import 'package:discover_earth/screens/conversation_screen/widgets/conversation_initiative.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key});

  final _conversationItems = [
    ConversationContainer(
      image: Assets.icons.nature,
      count: '2.8M',
      description: 'Acres Protected',
    ),
    ConversationContainer(
      image: Assets.icons.drop,
      count: '42',
      description: 'Conservation Projects',
    ),
    ConversationContainer(
      image: Assets.icons.patrons,
      count: '186',
      description: 'Active Patrons',
    ),
    ConversationContainer(
      image: Assets.icons.diagram,
      count: '\$18.5M',
      description: 'Conservation Funding',
    ),
  ];

  final _conversationInitiative = [
    ConversationInitiative(
      title: 'Great Barrier Reef Restoration',
      description:
          'Supporting innovative coral regeneration techniques and marine protected areas to preserve the world`s largest reef system.',
      countRaised: 3.2,
      countGoal: 4.5,
    ),
    ConversationInitiative(
      title: 'Arctic Wilderness Protection',
      description:
          'Advocating for expanded protected areas in the Arctic to preserve critical habitats for polar species facing climate threats.',
      countRaised: 1.2,
      countGoal: 3.0,
    ),
    ConversationInitiative(
      title: 'Amazon Rainforest Corridor',
      description:
          'Creating protected wildlife corridors to connect fragmented habitats and preserve biodiversity in the Amazon basin.',
      countRaised: 2.4,
      countGoal: 4.0,
    ),
    ConversationInitiative(
      title: 'African Elephant Sanctuary',
      description:
          'Supporting community-led conservation efforts to protect elephant migration corridors and reduce human-wildlife conflict.',
      countRaised: 2.55,
      countGoal: 3.0,
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
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      color: AppColors.scaffold,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallerThanDesktop ? 30.0 : 10.0,
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
                  'Conservation Impact',
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
                      'Track the real-time impact of our collective efforts to preserve Earth`s most sacred natural spaces.',
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
                (isMobile)
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _conversationItems.sublist(0, 2),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _conversationItems.sublist(2, 4),
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _conversationItems,
                    ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ..._conversationItems.map((item) {
                //       return item;
                //     }),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    top: smallerThanLaptop ? 32.0 : 64.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.scaffold,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 32.0,
                              bottom: 24.0,
                            ),
                            child: Text(
                              'Current Conservation Initiatives',
                              style: textTheme.titleMedium!.copyWith(
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                        // Wrap(children: _conversationInitiative,)
                        smallerThanLaptop
                            ? Column(
                              children:
                                  _conversationInitiative.map((item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: item,
                                    );
                                  }).toList(),
                            )
                            : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 20.0,
                                    childAspectRatio:
                                        smallerThanLaptop ? 3.5 : 3.0,
                                  ),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _conversationInitiative.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _conversationInitiative[index],
                                );
                              },
                            ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: smallerThanLaptop ? 24.0 : 48.0,
                  ),
                  child: SizedBox(
                    width: 200.0,
                    height: 44.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('View Impact Report'),
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
