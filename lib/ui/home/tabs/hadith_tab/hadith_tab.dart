import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/ui/home/tabs/hadith_tab/widgets/hadith_item.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  PageController pageController = PageController(viewportFraction: 0.8);

  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.ahadithBackground),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsManager.islamiHeader,
                width: screenWidth * .75,
              ),
            ),
            SizedBox(height: 55),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) => HadithItem(
                  isSelected: index == selectedPageIndex, index: index,
                ),
                itemCount: 50,
                onPageChanged: (currentPageIndex) {
                  setState(() {
                    selectedPageIndex = currentPageIndex;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
