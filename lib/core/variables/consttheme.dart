import 'package:flutter/material.dart';

class AppTheme {
  BoxDecoration kContainerDecoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(16)),
    boxShadow: [
      BoxShadow(
        color: Colors.tealAccent,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );
}
