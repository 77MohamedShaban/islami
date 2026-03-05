import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';

class Chioesed extends StatelessWidget {
  final bool currentPage;
  const Chioesed({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:8,
      height: 8
      ,decoration: BoxDecoration(
        color:currentPage? ColorsManager.gold  : ColorsManager.gray,
        shape: BoxShape.circle
    ),
    );
  }
}
