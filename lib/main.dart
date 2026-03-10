import 'package:flutter/material.dart';
import 'package:islami/ui/hadith_details/screen/hadith_details_screen.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/intro/screen/intro_screen.dart';
import 'package:islami/ui/sura_details/screen/sura_details_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
    );
  }
}
