import 'package:discover_earth/resources/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68.0),
        child: AppBar(
          backgroundColor: AppColors.scaffold,
          title: Row(children: [
            Text('Eden Reverie', style: Theme.of(context).textTheme.titleMedium,),

          ],),
        ),
      ),
    );
  }
}
