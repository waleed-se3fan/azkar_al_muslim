import 'package:azkar_al_muslim/app/plash_screen/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..timer(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Image.asset(
                      'images/splash.png',
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                  const Text(
                    'أذكار المسلم',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text('AZKAR AL-MUSLIM',
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
