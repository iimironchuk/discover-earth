import 'package:discover_earth/gen/assets.gen.dart';
import 'package:discover_earth/screens/map_screen/widgets/properties_column.dart';
import 'package:flutter/material.dart';

class MapWithPropertiesRow extends StatelessWidget {
  const MapWithPropertiesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertiesColumn(),
        SizedBox(height: 20.0,),
        Assets.images.map.image(fit: BoxFit.cover),
      ],
    );
  }

}
