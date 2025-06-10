import 'package:discover_earth/resources/app_theme.dart';
import 'package:discover_earth/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:
          (context, child) => ResponsiveBreakpoints(
            breakpoints: [
              const Breakpoint(start: 0, end: 480, name: MOBILE),
              const Breakpoint(start: 481, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1280, name: 'Laptop'),
              const Breakpoint(start: 1281, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            child: child!,
          ),
      theme: AppTheme.themeData,
      home: Wrapper(),
    );
  }
}
