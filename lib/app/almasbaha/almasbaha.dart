import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AlbasbahaScreen extends StatelessWidget {
  const AlbasbahaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('المسبحة'),
      ),
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    cubit.sebhaNum.toString(),
                    style: const TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      cubit.sebhaReset();
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black)),
                  ),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.sebhaInc();
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow[50])),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
