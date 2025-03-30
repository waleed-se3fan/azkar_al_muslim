import 'package:flutter/material.dart';

import '../../app/abou_app_screen/about_app.dart';
import '../../app/almasbaha/almasbaha.dart';
import '../../app/asmaa_allah/asmaa_allah.dart';
import '../../app/asmaa_allah/azkar_alsabah/azkar_alsabah.dart';
import '../../app/azkar_screen/azkar.dart';
import '../../app/quraan_screen/quraan.dart';
import '../../app/roqya_screen/roqya.dart';
import '../../app/setting/fontsize.dart';
import '../../app/setting/nightmode.dart';

// ignore: non_constant_identifier_names
List HomeWidget = [
  const QuraanScreen(),
  RoqyaScreen(),
  const AsmmaAllah(),
  Azkar('أذكار المساء'),
  Azkar('أذكار الصلاة'),
  Azkar('أذكار النوم'),
  AzkarAlsabahScreen(),
  Azkar('تسابيح'),
  const AlbasbahaScreen(),
];

List images = [
  'assets/images/home/azkar1.png',
  'assets/images/home/roqua.png',
  'assets/images/third.png',
  'assets/images/home/moon.png',
  'assets/images/home/akar.png',
  'assets/images/home/bed.png',
  'assets/images/home/sun.png',
  'assets/images/home/azkar.png',
  'assets/images/home/sebha.png'
];

List setting = ['وضع ليلي', 'حجم الخط', 'حول التطبيق'];
List settingScreens = [
  const NightModeScreen(),
  const FontSizeScreen(),
  const AboutAppScreen()
];

var dard = ThemeData(
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.teal[500],
    unselectedItemColor: Colors.white,
  ),
  iconTheme: IconThemeData(color: Colors.teal[500]),
  brightness: Brightness.dark,

  // ignore: prefer_const_constructors
  appBarTheme:
      AppBarTheme(elevation: 0, centerTitle: true, color: Colors.black),
);

var white = ThemeData(
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: Colors.teal[700],
  ),
  iconTheme: IconThemeData(color: Colors.teal[500]),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.yellow[50]),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 28, // Bigger icon size
    ),
    toolbarHeight: 70, // Increased height for better visibility
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.teal[500],
);
