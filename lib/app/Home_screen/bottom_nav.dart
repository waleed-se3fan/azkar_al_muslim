import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.widgets[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.teal[500],
                unselectedItemColor: Colors.teal[500],
                currentIndex: cubit.currentIndex,
                onTap: (i) {
                  cubit.changeIndex(i);
                },
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: ''),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.star), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.compass_calibration), label: ''),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.question_mark_rounded), label: ''),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: ''),
                ]),
          );
        },
      ),
    );
  }
}
