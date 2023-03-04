import 'package:azkar_al_muslim/main.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Home_screen/bottomNB.dart';
import '../Home_screen/home.dart';
import '../abou_app_screen/about_app.dart';
import '../setting/nightmode.dart';
import '../setting/setting.dart';
import '../stared_screen/star_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  bool get darkMode => isDark;

  static List staredList = [];
  void addToStarList(value) {
    staredList.add(value);

    emit(AddToListState());
  }

  int currentIndex = 0;
  void changeIndex(i) {
    currentIndex = i;
    emit(Stateeeee());
  }

  List widgets = [
    HomeScreen(),
    StaredScreen(),
    AboutAppScreen(),
    SettingScreen()
  ];

  /*switching(context, index) {
    switch (index) {
      case 0:
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(child: HomeScreen());
          },
        );
      case 1:
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(child: StaredScreen());
          },
        );
      case 2:
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(child: NightModeScreen());
          },
        );
      case 3:
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(child: AboutAppScreen());
          },
        );
      case 4:
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(child: SettingScreen());
          },
        );
    }
  }
*/

  static bool isDarkMode = false;

  void darkmode() {
    isDarkMode = true;
    emit(DarkState());
  }

  void lightmode() {
    isDarkMode = false;
    emit(LighState());
  }

  int sebhaNum = 0;
  void sebhaInc() {
    sebhaNum++;
    emit(SebhaIncState());
  }

  void sebhaReset() {
    sebhaNum = 0;
    emit(sebhaResetState());
  }

  static double font_size = 16;
  void changeFontSize(f) {
    font_size = f;
    emit(ChangeFontSize());
  }
}
