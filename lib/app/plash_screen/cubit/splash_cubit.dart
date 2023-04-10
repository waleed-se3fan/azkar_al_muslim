import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/quraan.dart';
import '../../onboarding/onboarding_screen.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  void timer(context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
      }));
    });
  }
}
