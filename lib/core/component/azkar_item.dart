import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class AzkarItem extends StatelessWidget {
  String azkar = '';

  AzkarItem(this.azkar);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.yellow[50],
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      azkar,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: AppCubit.font_size),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 1.5)),
                            child: Container(
                                child: IconButton(
                                    onPressed: () {
                                      cubit.addToStarList(azkar);
                                    },
                                    icon: Icon(Icons.star)))),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 1.5)),
                            child: IconButton(
                                onPressed: () {
                                  FlutterShare.share(text: azkar, title: azkar);
                                },
                                icon: Icon(Icons.share))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
