import 'package:flutter/material.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/model/hadith_model.dart';
import '../../../core/resources/assets_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = "hadith_details";

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    HadithModel hadithData =
        ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        title: Text("${StringsManager.hadith} ${hadithData.hadithNumber}"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: ColorsManager.gold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManager.gold),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AssetsManager.leftCornerHadith,
                            color: ColorsManager.gold,
                          ),
                          Image.asset(
                            AssetsManager.rightCornerHadith,
                            color: ColorsManager.gold,
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: screenWidth * .46,
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            hadithData.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsManager.gold,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17,)
                  ,Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadithData.content,
                        textAlign: TextAlign.center
                        ,textDirection: TextDirection.rtl
                        ,style: TextStyle(
                        height: 2
                        ,fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.gold,
                      ),
                      ),
                    ),
                  ),
                ],)),
          ),

          Image.asset(AssetsManager.mosqueHadithDetails),
        ],
      ),
    );
  }
}
