import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/app/plash_screen/plash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/variables/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit()..getSurahs(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppCubit.isDarkMode ? dard : white,
              home: const SplashScreen());
        },
      ),
    );
  }
}
