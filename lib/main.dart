import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/app/plash_screen/plash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
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
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppCubit.isDarkMode
                  ? ThemeData(
                      textTheme: Theme.of(context)
                          .textTheme
                          .apply(bodyColor: Colors.teal[500]),

                      iconTheme: IconThemeData(color: Colors.teal[500]),
                      brightness: Brightness.dark,
                      // ignore: prefer_const_constructors
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
              home: const SplashScreen());
        },
      ),
    );
  }
}
