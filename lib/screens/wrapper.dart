import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/resources/app_colors.dart';
import 'package:discover_earth/screens/community_screen/community_screen.dart';
import 'package:discover_earth/screens/conversation_screen/conversation_screen.dart';
import 'package:discover_earth/screens/expeditions_screen/expeditions_screen.dart';
import 'package:discover_earth/screens/footer/footer.dart';
import 'package:discover_earth/screens/gallery_screen/gallery_screen.dart';
import 'package:discover_earth/screens/journal_screen/journal_screen.dart';
import 'package:discover_earth/screens/main_screen.dart';
import 'package:discover_earth/screens/map_screen/map_screen.dart';
import 'package:discover_earth/screens/nature_art_screen/nature_art_screen.dart';
import 'package:discover_earth/screens/patrons_club_screen/patrons_club_screen.dart';
import 'package:discover_earth/screens/widgets/custom_drawer.dart';
import 'package:discover_earth/screens/widgets/header_label.dart';
import 'package:discover_earth/screens/widgets/language_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  final GlobalKey galleryKey = GlobalKey();
  final GlobalKey expeditionsKey = GlobalKey();
  final GlobalKey patronsKey = GlobalKey();
  final GlobalKey artVaultKey = GlobalKey();
  final GlobalKey journalKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.scaffold,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              smallerThanDesktop
                  ? Builder(
                    builder:
                        (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: SvgPicture.asset(Assets.icons.drawer),
                        ),
                  )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 47.0),
                child: Text(
                  'Eden Reverie',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: isMobile ? 20.0 : 30.0,
                  ),
                ),
              ),
              if (!smallerThanDesktop)
                SeparatedRow(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    HeaderLabel(
                      title: 'Living Gallery',
                      onTap: () => _scrollToSection(galleryKey),
                    ),
                    HeaderLabel(
                      title: 'Expeditions',
                      onTap: () => _scrollToSection(expeditionsKey),
                    ),
                    HeaderLabel(
                      title: 'Nature Patrons',
                      onTap: () => _scrollToSection(patronsKey),
                    ),
                    HeaderLabel(
                      title: 'Art Vault',
                      onTap: () => _scrollToSection(artVaultKey),
                    ),
                    HeaderLabel(
                      title: 'Journal',
                      onTap: () => _scrollToSection(journalKey),
                    ),
                  ],
                  separatorBuilder: (context, index) => SizedBox(width: 32.0),
                ),
              Spacer(),
              if (!isMobile)
                SeparatedRow(
                  children: [
                    SvgPicture.asset(Assets.icons.search),
                    SvgPicture.asset(Assets.icons.profile),
                    LanguageDropdown(),
                  ],
                  separatorBuilder: (context, index) => SizedBox(width: 27.0),
                ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(
        onScrollToGallery: () {
          _scrollToSection(galleryKey);
          Navigator.pop(context);
        },
        onScrollToExpeditions: () {
          _scrollToSection(expeditionsKey);
          Navigator.pop(context);
        },
        onScrollToNaturePatrons: () {
          _scrollToSection(patronsKey);
          Navigator.pop(context);
        },
        onScrollToArtVault: () {
          _scrollToSection(artVaultKey);
          Navigator.pop(context);
        },
        onScrollToJournal: () {
          _scrollToSection(journalKey);
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainScreen(),
            KeyedSubtree(key: galleryKey, child: GalleryScreen()),
            KeyedSubtree(key: expeditionsKey, child: ExpeditionsScreen()),
            KeyedSubtree(key: patronsKey, child: PatronsClubScreen()),
            KeyedSubtree(key: artVaultKey, child: NatureArtScreen()),
            KeyedSubtree(key: journalKey, child: JournalScreen()),
            MapScreen(),
            ConversationScreen(),
            CommunityScreen(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
