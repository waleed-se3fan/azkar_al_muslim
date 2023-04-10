import 'package:azkar_al_muslim/app/quraan_screen/surah_screen.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:azkar_al_muslim/data/quraan.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuraanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('القران الكريم'),
      ),
      body: GridView.builder(
          itemCount: x.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return SurrahScreen(index, x[index]['name']);
                }));
              },
              child: Card(
                child: Center(child: Text(x[index]['name'])),
              ),
            );
          }),
    );
  }
}
