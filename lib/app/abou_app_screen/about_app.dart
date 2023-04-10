import 'package:flutter/material.dart';

import 'package:flutter_share/flutter_share.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('حول التطبيق'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'تطبيق أذكار المسلم تطبيق يضم أكثر من مائة ذكر ودعاء من القرأن الكريم والسنة النبوية الشريفة , وأسماء الله الحسني والرقية الشرعية',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.yellow[50], fontSize: 20),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow[50]),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(13)),
                ),
                onPressed: () async {
                  await FlutterShare.share(
                    linkUrl: 'https://flutter.dev/',
                    title: 'share app',
                  );
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.teal[500],
                ),
                label: Text(
                  'شارك الان',
                  style: TextStyle(color: Colors.teal[500]),
                )),
          )
        ],
      ),
    );
  }
}
