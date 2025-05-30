import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLang = 'EN';

  final Map<String, String> languages = {
    'EN': '1',
    'UA': '2',
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 65),
      offset: const Offset(0, 30),
      onSelected: (value) {
        setState(() {
          _selectedLang = value;
        });
      },
      itemBuilder: (context) {
        return languages.keys.map((lang) {
          return PopupMenuItem<String>(
            value: lang,
            child: Text(lang),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selectedLang,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              Assets.icons.expandArrow,
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
