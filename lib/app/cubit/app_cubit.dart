import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home_screen/home.dart';
import '../abou_app_screen/about_app.dart';
import '../compass/compass_screen.dart';
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
    const HomeScreen(),
    const StaredScreen(),
    const Appp(),
    const AboutAppScreen(),
    const SettingScreen()
  ];

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

  // ignore: non_constant_identifier_names
  static double font_size = 16;
  void changeFontSize(f) {
    font_size = f;
    emit(ChangeFontSize());
  }
}
