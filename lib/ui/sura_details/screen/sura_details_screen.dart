import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraText.isEmpty) {
      readFile(suraModel.suraNumber);
    }
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.gold),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          suraModel.suraNameEn,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.gold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(
                        suraModel.suraNameAr,
                        style: TextStyle(
                          color: ColorsManager.gold,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  SizedBox(height: 3),
                  Expanded(
                    child: suraText.isEmpty
                        ? Center(child: CircularProgressIndicator(color: ColorsManager.gold))
                        : SingleChildScrollView(
                            child: Text(
                              suraText,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                height: 2.5,
                                color: ColorsManager.gold,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.mosque),
        ],
      ),
    );
  }

  String suraText = "";

  readFile(int suraNumber) async {
    String suraTextFile = await rootBundle.loadString(
      "assets/suras/$suraNumber.txt",
    );
    List<String> suraLines = suraTextFile.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraText += suraLines[i];
      suraText += "[${i + 1}]";
    }
    setState(() {});
  }
}
