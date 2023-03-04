import 'package:azkar_al_muslim/app/asmaa_allah/asmma_allah_details.dart';
import 'package:azkar_al_muslim/core/component/azkar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/variables/lists.dart';

class AsmmaAllah extends StatelessWidget {
  const AsmmaAllah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('أسماء الله الحسني'),
      ),
      body: GridView.builder(
          itemCount: Lists().asmaa_allah.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (c, i) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return AsmmaAllahDetail(i);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                      child: Text(
                    Lists().asmaa_allah[i],
                    style: const TextStyle(color: Colors.amber),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.amber)),
                ),
              ),
            );
          }),
    );
  }
}
