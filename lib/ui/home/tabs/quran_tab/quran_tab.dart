import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/remote/local/prefs_manager.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/most_recently_item.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/sura_item.dart';
import 'package:islami/ui/intro/screen/intro_screen.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredSuras = SuraModel.surasList;
  late List<SuraModel> mostRecentlySuras ;
  String searchValue = "";
  @override
  void initState() {
    // TODO: implement initState
    mostRecentlySuras= PrefsManager.getMostRecently();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  width: screenWidth * .75,
                ),
              ),
              SizedBox(height: 21),
              TextField(
                onChanged: (value) {
                  onSearch(value);
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorColor: ColorsManager.gold,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 15,
                      top: 14,
                      bottom: 13,
                    ),
                    child: SvgPicture.asset(
                      AssetsManager.home,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.gold,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  hintText: StringsManager.suraName,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                  filled: true,
                  fillColor: ColorsManager.black.withValues(alpha: 0.7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorsManager.gold),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorsManager.gold),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorsManager.gold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (searchValue.isEmpty) ...[
                Text(
                  StringsManager.mostRecently,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: mostRecentlySuras.isEmpty
                      ? Center(
                        child: Text(
                            StringsManager.noSavedSuras,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.white,
                            ),
                          ),
                      )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              MostRecentlyItem(sura: mostRecentlySuras[index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemCount: mostRecentlySuras.length,
                        ),
                ),
                SizedBox(height: 10),
                Text(
                  StringsManager.surasList,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                ),
              ],
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      SuraItem(sura: filteredSuras[index],onClick: () {
                        mostRecentlySuras.remove(filteredSuras[index]);
                        mostRecentlySuras.insert(0, filteredSuras[index]);
                        PrefsManager.saveMostRecently(mostRecentlySuras);
                        setState(() {

                        });
                      },),
                  separatorBuilder: (context, index) =>
                      Divider(height: 20, indent: 40, endIndent: 40),
                  itemCount: filteredSuras.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSearch(String value) {
    searchValue = value;
    if (searchValue.isNotEmpty) {
      filteredSuras = SuraModel.surasList.where((element) {
        if (element.suraNameEn.toLowerCase().contains(
              searchValue.toLowerCase(),
            ) ||
            element.suraNameAr.contains(searchValue)) {
          return true;
        }
        return false;
      }).toList();
    } else {
      filteredSuras = SuraModel.surasList;
    }

    setState(() {});
  }
}
