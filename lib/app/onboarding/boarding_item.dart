import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Home_screen/bottomNB.dart';
import '../Home_screen/home.dart';

class BordingItem extends StatefulWidget {
  int index = 0;
  BordingItem(this.index);

  @override
  State<BordingItem> createState() => _BordingItemState();
}

class _BordingItemState extends State<BordingItem> {
  List images = ['images/first.png', 'images/second.png', 'images/third.png'];

  List title = [
    'مرحبا بك في تطبيق \nاذكار المسلم',
    'أكثر من مائة ذكر \nودعاء من القران \nوالسنة النبوية',
    'قران كريم \nواحاديث نبوية \nوأسماء الله الحسني'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: TextStyle(
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
                      label:
                          Text('السابق', style: TextStyle(color: Colors.teal)),
                      icon: Icon(CupertinoIcons.arrowtriangle_left_square)),
              widget.index == 2
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BottomNavBar();
                        }));
                      },
                      child: Text(
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
                          icon: Icon(CupertinoIcons.arrowtriangle_right_square),
                          label: Text(
                            'التالي',
                            style: TextStyle(color: Colors.teal),
                          )),
                    )
            ],
          )
        ],
      ),
    );
    ;
  }
}
