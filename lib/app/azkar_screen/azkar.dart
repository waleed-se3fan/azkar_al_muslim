import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Azkar extends StatelessWidget {
  String text;
  Azkar(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ListView.builder(itemBuilder: (c, i) {
        return AzkarItem(Lists().azkar[i]);
      }),
    );
  }
}
