import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/model/intro_model.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/intro/widgets/chioesed.dart';
import 'package:islami/ui/intro/widgets/intro_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "introScreen";

  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  List<IntroModel> introDataList = [
    IntroModel(
      image: AssetsManager.introImage_1,
      title: StringsManager.introTitle_1,
      description: "",
    ),
    IntroModel(
      image: AssetsManager.introImage_2,
      title: StringsManager.introTitle_2,
      description: StringsManager.introDescription_1,
    ),
    IntroModel(
      image: AssetsManager.introImage_3,
      title: StringsManager.introTitle_3,
      description: StringsManager.introDescription_2,
    ),
    IntroModel(
      image: AssetsManager.introImage_4,
      title: StringsManager.introTitle_4,
      description: StringsManager.introDescription_3,
    ),
    IntroModel(
      image: AssetsManager.introImage_5,
      title: StringsManager.introTitle_5,
      description: StringsManager.introDescription_4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(AssetsManager.islamiHeader, width: screenWidth * .75),
              SizedBox(height: 60),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) =>
                      IntroItem(introData: introDataList[index]),
                  itemCount: introDataList.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: currentIndex > 0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.gold,
                          ),
                        ),
                      ),
                    ),
                  Row(
                    children: List.generate(
                      introDataList.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chioesed(
                          currentPage: currentIndex == index,
                        ),
                      ),
                    ),
                  ),
                    TextButton(
                      onPressed: () async {
                        if (currentIndex == introDataList.length - 1) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('is_intro_shown', true);
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                        } else {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        currentIndex== (introDataList.length-1)?"Finish":"Next",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.gold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
