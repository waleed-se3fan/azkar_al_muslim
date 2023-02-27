import 'package:azkar_al_muslim/app/Home_screen/bottomNB.dart';
import 'package:azkar_al_muslim/app/plash_screen/plash_screen.dart';
import 'package:azkar_al_muslim/app/roqya_screen/roqya.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../almasbaha/almasbaha.dart';
import '../azkar_alsabah/azkar_alsabah.dart';

class HomeScreen extends StatelessWidget {
  List titless = [
    'القران الكريم',
    'الرقية الشرعية',
    'السيرة النبوية',
    'ادعية مختارة',
    'اذكار الصباح',
    'اذكار المساء',
    'اذكار الصلاة',
    'اذكار النوم',
    'أسماء الله الحسني',
    'تسابيح',
    'المسبحة'
  ];

  List images = [
    'images/home/quran.png',
    'images/home/roqua.png',
    'images/home/muhammad.png',
    'images/home/azkar.png',
    'images/home/sun.png',
    'images/home/moon.png',
    'images/home/azkar.png',
    'images/home/bed.png',
    'images/home/azkar1.png',
    'images/home/akar.png',
    'images/home/sebha.png'
  ];

  List HomeWidget = [
    AlbasbahaScreen(),
    RoqyaScreen(),
    Container(),
    Container(),
    AzkarAlsabahScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
    AlbasbahaScreen(),
    AlbasbahaScreen(),
    AlbasbahaScreen(),
    AlbasbahaScreen(),
    AlbasbahaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية'),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: GridView.builder(
            itemCount: titless.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (c, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return HomeWidget[i];
                  }));
                },
                child: Column(
                  children: [
                    Image.asset(images[i]),
                    Text(
                      titless[i],
                      style: TextStyle(color: Colors.yellow[50]),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
