import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StaredScreen extends StatelessWidget {
  const StaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('المميزة'),
      ),
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return AppCubit.staredList.length == 0
                ? const Center(
                    child: Text(
                      'لا يوجد شئ في المميزة',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: AppCubit.staredList.length,
                    itemBuilder: (c, i) {
                      return AzkarItem(AppCubit.staredList[i]);
                    });
          },
        ),
      ),
    );
  }
}
