import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/most_recently_item.dart';
import 'package:islami/ui/home/tabs/quran_tab/widgets/sura_item.dart';
import 'package:islami/ui/intro/screen/intro_screen.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => MostRecentlyItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
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
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(sura: SuraModel.surasList[index],),
                  separatorBuilder: (context, index) => Divider(
                    height: 20,
                    indent: 40,
                    endIndent: 40,
                  ),
                  itemCount: SuraModel.surasList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
