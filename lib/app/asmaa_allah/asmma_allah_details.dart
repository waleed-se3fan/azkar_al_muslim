import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:azkar_al_muslim/core/variables/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AsmmaAllahDetail extends StatelessWidget {
  int index;
  AsmmaAllahDetail(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(Lists().asmaa_allah[index]),
      ),
      body: Center(
        child: AzkarItem(Lists().asmaa_allah_means[index]),
      ),
    );
  }
}
