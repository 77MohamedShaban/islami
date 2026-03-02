import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر", "أستغفر الله"];
  int azkarIndex = 0;
  int sebhaCounter = 1;
  double turns =0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.islamiHeader, width: screenWidth * .75),
            SizedBox(height: 16),
            Text(
              StringsManager.sebhaTitle,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: ColorsManager.white,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(AssetsManager.sebhaCounterHead, width: 130),
            InkWell(
              onTap: azkarAction,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AnimatedRotation(
                      turns: turns.toDouble(),
                      duration: Duration(milliseconds: 500 ),
                      child: Image.asset(AssetsManager.sebhaCounter),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        azkar[azkarIndex],
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.white,
                        ),
                      ),
                      Text(
                        sebhaCounter.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void azkarAction(){
    if (sebhaCounter < 33) {
      sebhaCounter++;
      turns+=1/30;
    } else {
      sebhaCounter = 1;
      if ((azkarIndex + 1) == azkar.length) {
        azkarIndex = 0;
      } else {
        azkarIndex++;
      }
    }
    setState(() {});
}

}
