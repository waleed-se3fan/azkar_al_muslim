import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AzkarAlsabahScreen extends StatelessWidget {
  var roqualist = Lists();

  AzkarAlsabahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('أذكار الصباح والمساء'),
      ),
      body: ListView.builder(
          itemCount: roqualist.azkarSabah.length,
          itemBuilder: (c, i) {
            return AzkarItem(roqualist.azkarSabah[i]);
          }),
    );
  }
}
