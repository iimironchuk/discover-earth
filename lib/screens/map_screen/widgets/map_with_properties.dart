import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/map_screen/widgets/custom_checkbox.dart';
import 'package:discover_earth/screens/map_screen/widgets/properties_column.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class MapWithProperties extends StatefulWidget {
  const MapWithProperties({super.key});

  @override
  State<MapWithProperties> createState() => _MapWithPropertiesState();
}

class _MapWithPropertiesState extends State<MapWithProperties> {
  @override
  Widget build(BuildContext context) {
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final largerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).largerThan(DESKTOP);
    final textTheme = Theme.of(context).textTheme;
    final fullWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (fullWidth / 1472).clamp(0.7, 1.0);
    return AspectRatio(
      aspectRatio: 1472.0 / 600.0,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Assets.images.map.image(fit: BoxFit.cover),
              ),
            ),
            Positioned(
              // top: 24.0,
              // left: 24.0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: FractionallySizedBox(
                  widthFactor:
                      smallerThanLaptop
                          ? 0.4
                          : largerThanDesktop
                          ? 0.1
                          : 0.2,
                  heightFactor:
                      smallerThanLaptop
                          ? 0.9
                          : largerThanDesktop
                          ? 0.3
                          : 0.6,
                  child: PropertiesColumn(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
