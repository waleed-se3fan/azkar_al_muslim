import 'package:azkar_al_muslim/app/Home_screen/bottomNB.dart';
import 'package:azkar_al_muslim/app/asmaa_allah/asmaa_allah.dart';
import 'package:azkar_al_muslim/app/azkar_screen/azkar.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/app/plash_screen/plash_screen.dart';
import 'package:azkar_al_muslim/app/quran_kareem/quraan.dart';
import 'package:azkar_al_muslim/app/roqya_screen/roqya.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../almasbaha/almasbaha.dart';
import '../azkar_alsabah/azkar_alsabah.dart';

class HomeScreen extends StatelessWidget {
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

  List HomeWidget = [
    RoqyaScreen(),
    AsmmaAllah(),
    Azkar('أذكار المساء'),
    Azkar('أذكار الصلاة'),
    Azkar('أذكار النوم'),
    AzkarAlsabahScreen(),
    Azkar('تسابيح'),
    AlbasbahaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('الرئيسية'),
              ),
              body: Container(
                  padding: EdgeInsets.all(18),
                  child: GridView.builder(
                      itemCount: titless.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) {
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
                      })));
        },
      ),
    );

    /* Scaffold(
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
 */
  }
}
