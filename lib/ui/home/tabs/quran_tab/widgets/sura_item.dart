import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/model/sura_model.dart';

class SuraItem extends StatelessWidget {
 final SuraModel sura;
  const SuraItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AssetsManager.quranFrame),
          Text(sura.suraNumber.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: ColorsManager.white),)
        ],
      ),
      SizedBox(width: 24,),
      Expanded(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start
        ,children: [
          Text(sura.suraNameEn,style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w700,color: ColorsManager.white),)
          ,Text("${sura.versesNumber} Verses",style: TextStyle(fontSize:14 ,fontWeight: FontWeight.w700,color: ColorsManager.white),)
        ],),
      ),
      Text(sura.suraNameAr,style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w700,color: ColorsManager.white),)
    ],);
  }
}
