import 'package:azkar_al_muslim/app/Home_screen/cubit/home_screen_cubit.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StaredScreen extends StatelessWidget {
  const StaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeScreenCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('المميزة'),
      ),
      body: BlocProvider(
        create: (context) => HomeScreenCubit()..getFavouriteData(),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is GetFavouriteDataState) {
              if (state.data.isEmpty) {
                return const Center(
                  child: Text(
                    'لا يوجد شئ في المميزة',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data.length,
                    itemBuilder: (c, i) {
                      return AzkarItem(state.data[i]);
                    });
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
