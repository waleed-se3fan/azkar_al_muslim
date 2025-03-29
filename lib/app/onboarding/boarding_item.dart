import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_screen/bottom_nav.dart';

// ignore: must_be_immutable
class BordingItem extends StatefulWidget {
  int index = 0;
  BordingItem(this.index, {super.key});

  @override
  State<BordingItem> createState() => _BordingItemState();
}

class _BordingItemState extends State<BordingItem> {
  List images = [
    'assets/images/first.png',
    'assets/images/second.png',
    'assets/images/third.png'
  ];

  List title = [
    'مرحبا بك في تطبيق \nاذكار المسلم',
    'أكثر من مائة ذكر \nودعاء من القران \nوالسنة النبوية',
    'قران كريم \nواحاديث نبوية \nوأسماء الله الحسني'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            images[widget.index],
            color: Colors.teal,
            fit: BoxFit.cover,
          ),
          Text(title[widget.index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == 0 ? Colors.teal : Colors.green[50]),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == 1 ? Colors.teal : Colors.green[50]),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == 2 ? Colors.teal : Colors.green[50]),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.index == 0
                  ? Container()
                  : TextButton.icon(
                      style: ButtonStyle(
                          iconColor: MaterialStateProperty.all(Colors.teal)),
                      onPressed: () {
                        widget.index--;
                        setState(() {});
                      },
                      label: const Text('السابق',
                          style: TextStyle(color: Colors.teal)),
                      icon:
                          const Icon(CupertinoIcons.arrowtriangle_left_square)),
              widget.index == 2
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const BottomNavBar();
                        }));
                      },
                      child: const Text(
                        'ابدأالان',
                      ))
                  : Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              iconColor:
                                  MaterialStateProperty.all(Colors.teal)),
                          onPressed: () {
                            widget.index++;
                            setState(() {});
                          },
                          icon: const Icon(
                              CupertinoIcons.arrowtriangle_right_square),
                          label: const Text(
                            'التالي',
                            style: TextStyle(color: Colors.teal),
                          )),
                    )
            ],
          )
        ],
      ),
    );
  }
}
