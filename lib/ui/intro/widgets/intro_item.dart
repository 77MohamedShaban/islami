import 'package:flutter/material.dart';
import 'package:islami/model/intro_model.dart';
import '../../../core/resources/colors_manager.dart';

class IntroItem extends StatelessWidget {
  IntroModel introData;

  IntroItem({required this.introData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(introData.image),
          if (introData.description.isEmpty) ...[
            SizedBox(height: 70),
            Text(
              introData.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.gold,
              ),
            ),
          ] else
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Text(
                 introData.title,
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w700,
                   color: ColorsManager.gold,
                 ),
               ),
               Text(
                 introData.description,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   height:1.3
                   ,fontSize: 20,
                   fontWeight: FontWeight.w700,
                   color: ColorsManager.gold,
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
