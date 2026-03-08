import 'package:flutter/material.dart';
import 'package:islami/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/intro/screen/intro_screen.dart';
import 'package:islami/ui/sura_details/screen/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isIntroShown = prefs.getBool('is_intro_shown') ?? false;

  runApp(MyApp(isIntroShown: isIntroShown));
}

class MyApp extends StatelessWidget {
  final bool isIntroShown;
  const MyApp({super.key, required this.isIntroShown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      initialRoute: isIntroShown ? HomeScreen.routeName : IntroScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
    );
  }
}
