import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/ui/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs=[QuranTab(),HadithTab(),SebhaTab(),RadioTab(),TimeTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: ColorsManager.gold,
        indicatorColor: ColorsManager.black.withValues(alpha: 0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: ColorsManager.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          );
        }),
        destinations: [
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AssetsManager.home_selected),
            icon: SvgPicture.asset(AssetsManager.home),
            label: StringsManager.homeTab,
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AssetsManager.hadith_selected),
            icon: SvgPicture.asset(AssetsManager.hadith),
            label: StringsManager.hadithTab,
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AssetsManager.sebha_selected),
            icon: SvgPicture.asset(AssetsManager.sebha),
            label: StringsManager.sebhaTab,
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AssetsManager.radio_selected),
            icon: SvgPicture.asset(AssetsManager.radio),
            label: StringsManager.radioTab,
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(AssetsManager.time_selected),
            icon: SvgPicture.asset(AssetsManager.time),
            label: StringsManager.timeTab,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
