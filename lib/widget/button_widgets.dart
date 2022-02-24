import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static Widget animatedButtonText(String text, {double fontSize = 48, required Function onTap, bool isAnimating = true}) {
    return SizedBox(
      height: fontSize * 1.5,
      child: Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: GoogleFonts.pressStart2p(
            fontSize: fontSize,
            color: Colors.white,
            letterSpacing: .5,
            shadows: const [
              Shadow(
                blurRadius: 7.0,
                color: Colors.white,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: isAnimating
              ? AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText(text),
                  ],
                  onTap: () => onTap(),
                )
              : GestureDetector(
                  child: Text(text),
                  onTap: () => onTap(),
                ),
        ),
      ),
    );
  }
}
