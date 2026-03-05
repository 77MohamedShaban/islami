import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/ui/hadith_details/screen/hadith_details_screen.dart';

class HadithItem extends StatefulWidget {
  final bool isSelected;
  final int index;

  const HadithItem({required this.isSelected, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadithDetailsScreen.routeName,arguments: hadithData);
      }
      ,child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.isSelected ? 0 : 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.gold,
        ),
        child: Column(
          children: [
            Expanded(
              child: hadithData == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.black,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                          children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(AssetsManager.leftCornerHadith),
                                  Image.asset(AssetsManager.rightCornerHadith),
                                ],
                              ),
                              Center(
                                child: Container(
                                   width: screenWidth * .46,
                                   margin: EdgeInsets.only(top: 30),
                                   child: Text(
                                    hadithData!.title,
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       color: ColorsManager.black,
                                       fontSize: 24,
                                       fontWeight: FontWeight.w700,
                                     ),
                                   ),
                                 ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    AssetsManager.hadithCardBack,
                                  ),
                                ),
                                Text(
                                  hadithData!.content,
                                  style: TextStyle(
                                    color: ColorsManager.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.45,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Image.asset(
              AssetsManager.mosqueHadith,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  HadithModel? hadithData;

  readHadithFile() async {
    String hadith = await rootBundle.loadString(
      "assets/ahadith/h${widget.index + 1}.txt",
    );
    List<String> hadithList = hadith.split("\n");
    String title = hadithList[0];
    hadithList.removeAt(0);
    String content = hadithList.join(" ");
    hadithData = HadithModel(title: title, content: content, hadithNumber: (widget.index + 1).toString());
    setState(() {
      print(hadithData);
    });
  }
}
