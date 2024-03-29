import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Azkar extends StatelessWidget {
  String text;
  Azkar(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(text),
      ),
      body: ListView.builder(itemBuilder: (c, i) {
        return AzkarItem(Lists().azkar[i]);
      }),
    );
  }
}
