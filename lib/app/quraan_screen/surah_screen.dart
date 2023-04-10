import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/data/quraan.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SurrahScreen extends StatelessWidget {
  SurrahScreen(this.index, this.surrahName, {super.key});
  String surrahName = '';
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(surrahName),
      ),
      body: ListView.builder(
          itemCount: x[index]['total_verses'],
          itemBuilder: (c, i) {
            return AzkarItem(x[index]['verses'][i]['text']);
          }),
    );
  }
}
