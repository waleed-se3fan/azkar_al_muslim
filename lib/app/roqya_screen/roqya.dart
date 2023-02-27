import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoqyaScreen extends StatelessWidget {
  var roqualist = Lists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('الرقية الشرعية'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: roqualist.roqya.length,
            itemBuilder: (c, i) {
              return AzkarItem(roqualist.roqya[i]);
            }),
      ),
    );
  }
}
