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
        title: const Text('المميزة'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          context.read<HomeScreenCubit>().getFavouriteData();
          print(state.toString());
          print(state);
          if (state is GetFavouriteDataState) {
            if (state.data.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (c, i) {
                    return InkWell(
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.delete),
                                    title: const Text('حذف من المميزة'),
                                    onTap: () {
                                      context
                                          .read<HomeScreenCubit>()
                                          .removeFromFavourite(i);
                                      Navigator.pop(context);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            'تم الحذف',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white, // لون النص
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          backgroundColor: Colors.teal,
                                          behavior: SnackBarBehavior.floating,
                                          margin: const EdgeInsets.all(16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          duration: const Duration(seconds: 2),
                                          action: SnackBarAction(
                                            label: 'UNDO',
                                            textColor: Colors.white,
                                            onPressed: () {},
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: AzkarItem(state.data[i]));
                  });

              ////
            } else {
              return const Center(
                child: Text(
                  'لا يوجد شئ في المميزة',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }
          } else if (state is GetFavouriteDataStateAfter) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (c, i) {
                  return InkWell(
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.delete),
                                  title: const Text('حذف من المميزة'),
                                  onTap: () {
                                    context
                                        .read<HomeScreenCubit>()
                                        .removeFromFavourite(i);
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                          'تم الحذف',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white, // لون النص
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: Colors.teal,
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.all(16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'UNDO',
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: AzkarItem(state.data[i]));
                });
          } else {
            return const Center(
              child: Text(
                'لا يوجد شئ في المميزة',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
