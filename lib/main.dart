import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:challenge_marvel_heroes/ui/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dependency_injection.dart' as sl;

void main() {
  sl.init();
  runApp(ChallengeMarvelHeroesApp());
}

class ChallengeMarvelHeroesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge Marvel Heroes',
      theme: _createTheme(),
      home: HomePage(),
    );
  }

  ThemeData _createTheme() {
    return ThemeData(
      backgroundColor: kColorSilver,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kColorSilver,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        iconTheme: IconThemeData(
          color: kColorDark,
        ),
        actionsIconTheme: IconThemeData(
          color: kColorDark,
        ),
      ),
      fontFamily: 'gilroy',
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontFamily: 'gilroy-heavy',
            fontWeight: FontWeight.w900,
            fontSize: 40),
        headline2: TextStyle(
            fontFamily: 'gilroy-heavy',
            fontWeight: FontWeight.w900,
            fontSize: 32,
            color: kColorDark),
        headline3: TextStyle(
            fontFamily: 'gilroy-heavy',
            fontWeight: FontWeight.w900,
            fontSize: 20),
        headline4: TextStyle(
            fontFamily: 'gilroy-medium',
            fontWeight: FontWeight.w700,
            fontSize: 18),
        headline5: TextStyle(
            fontFamily: 'gilroy-regular',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: kColorGrey),
        subtitle1: TextStyle(
            fontFamily: 'gilroy-medium',
            fontWeight: FontWeight.w500,
            fontSize: 16),
        subtitle2: TextStyle(
            fontFamily: 'gilroy-medium',
            fontWeight: FontWeight.w500,
            fontSize: 12),
        bodyText1: TextStyle(
            fontFamily: 'gilroy-medium',
            fontWeight: FontWeight.w500,
            fontSize: 14),
        bodyText2: TextStyle(
            fontFamily: 'gilroy-regular',
            fontWeight: FontWeight.w400,
            fontSize: 14),
        overline: TextStyle(
            fontFamily: 'gilroy-medium',
            fontWeight: FontWeight.w500,
            fontSize: 10),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
