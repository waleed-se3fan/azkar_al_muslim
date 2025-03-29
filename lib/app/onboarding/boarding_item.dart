import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_screen/bottom_nav.dart';

class BoardingItem extends StatefulWidget {
  const BoardingItem({super.key});

  @override
  State<BoardingItem> createState() => _BoardingItemState();
}

class _BoardingItemState extends State<BoardingItem> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<String> images = [
    'assets/images/first.png',
    'assets/images/second.png',
    'assets/images/third.png'
  ];

  List<String> titles = [
    'مرحبا بك في تطبيق \nاذكار المسلم',
    'أكثر من مائة ذكر \nودعاء من القران \nوالسنة النبوية',
    'قران كريم \nواحاديث نبوية \nوأسماء الله الحسني'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        images[index],
                        color: Colors.teal,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 12,
                width: _currentIndex == index ? 30 : 12,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? Colors.teal : Colors.teal[200],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex > 0
                    ? ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon:
                            const Icon(CupertinoIcons.arrowtriangle_left_fill),
                        label: const Text('السابق'),
                        onPressed: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      )
                    : const SizedBox(),
                _currentIndex == titles.length - 1
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()));
                        },
                        child: const Text('ابدأ الآن'),
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon:
                            const Icon(CupertinoIcons.arrowtriangle_right_fill),
                        label: const Text('التالي'),
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
