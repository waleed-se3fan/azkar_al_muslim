import 'package:azkar_al_muslim/app/Home_screen/bottomNB.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/app/plash_screen/plash_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/Home_screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppCubit.isDarkMode
                  ? ThemeData(
                      iconTheme: IconThemeData(color: Colors.teal[500]),
                      brightness: Brightness.dark,
                      appBarTheme: AppBarTheme(
                        elevation: 0,
                        centerTitle: true,
                      ),
                    )
                  : ThemeData(
                      iconTheme: IconThemeData(color: Colors.teal[500]),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          backgroundColor: Colors.yellow[50]),
                      appBarTheme: AppBarTheme(
                        backgroundColor: Colors.teal[500],
                        elevation: 0,
                        centerTitle: true,
                      ),
                      scaffoldBackgroundColor: Colors.teal[500],
                    ),
              home: SplashScreen());
        },
      ),
    );
  }
}
