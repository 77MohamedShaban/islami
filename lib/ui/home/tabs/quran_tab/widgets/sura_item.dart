import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/sura_details/screen/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
 final SuraModel sura;
  final void Function() onClick;
  const SuraItem({required this.sura,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,SuraDetailsScreen.routeName,arguments: sura);
        onClick();

      }
      ,child: Row(children: [
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
      ],),
    );
  }
}
