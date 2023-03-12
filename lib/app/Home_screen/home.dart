import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/variables/constant.dart';

import '../cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('الرئيسية'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(18),
                  child: GridView.builder(
                      itemCount: titless.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (c) {
                              return HomeWidget[i];
                            }));
                          },
                          child: Column(
                            children: [
                              Image.asset(images[i]),
                              Text(
                                titless[i],
                                style: TextStyle(color: Colors.yellow[50]),
                              ),
                            ],
                          ),
                        );
                      })));
        },
      ),
    );
  }
}
