import 'package:flutter/material.dart';

import 'boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return BordingItem(i);
          }),
    );
  }
}
