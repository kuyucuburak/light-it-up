import 'package:flutter/material.dart';

class ButtonWidgets {
  static Widget menuButton(String text) {
    return SizedBox(
      width: 136,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
