import 'package:azkar_al_muslim/app/Home_screen/home.dart';
import 'package:azkar_al_muslim/app/stared_screen/star_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/azkar_item.dart';
import '../abou_app_screen/about_app.dart';
import '../cubit/app_cubit.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_mark_rounded), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ]),
            tabBuilder: (BuildContext context, int index) {
              return Container();
            },
          );
        },
      ),
    );
  }
}
