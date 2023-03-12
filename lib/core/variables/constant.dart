import '../../app/abou_app_screen/about_app.dart';
import '../../app/almasbaha/almasbaha.dart';
import '../../app/asmaa_allah/asmaa_allah.dart';
import '../../app/azkar_alsabah/azkar_alsabah.dart';
import '../../app/azkar_screen/azkar.dart';
import '../../app/roqya_screen/roqya.dart';
import '../../app/setting/fontsize.dart';
import '../../app/setting/nightmode.dart';

// ignore: non_constant_identifier_names
List HomeWidget = [
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
  'images/home/roqua.png',
  'images/home/azkar1.png',
  'images/home/moon.png',
  'images/home/akar.png',
  'images/home/bed.png',
  'images/home/sun.png',
  'images/home/azkar.png',
  'images/home/sebha.png'
];
List titless = [
  'الرقية الشرعية',
  'أسماء الله الحسني',
  'اذكار المساء',
  'اذكار الصلاة',
  'اذكار النوم',
  'اذكار الصباح',
  'تسابيح',
  'المسبحة'
];

List setting = ['وضع ليلي', 'حجم الخط', 'حول التطبيق'];
List settingScreens = [
  const NightModeScreen(),
  const FontSizeScreen(),
  const AboutAppScreen()
];
