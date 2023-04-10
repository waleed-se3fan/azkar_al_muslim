import 'package:azkar_al_muslim/app/asmaa_allah/asmma_allah_details.dart';
import 'package:flutter/material.dart';

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
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
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
                child: Card(
                  // ignore: sort_child_properties_last
                  child: Center(
                      child: Text(
                    Lists().asmaa_allah[i],
                  )),
                ),
              ),
            );
          }),
    );
  }
}
