import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoqyaScreen extends StatelessWidget {
  var roqualist = Lists();

  RoqyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('الرقية الشرعية'),
      ),
      body: ListView.builder(
          itemCount: roqualist.roqya.length,
          itemBuilder: (c, i) {
            return AzkarItem(roqualist.roqya[i]);
          }),
    );
  }
}
