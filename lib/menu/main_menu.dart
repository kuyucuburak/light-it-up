import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/widget/button_widgets.dart';

class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';

  final PuzzleGame gameRef;

  const MainMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black.withAlpha(100),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 100),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Light It Up',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gameRef.gameController.startGamePlay();
                      gameRef.overlays.add(Hud.id);
                      gameRef.overlays.remove(MainMenu.id);
                    },
                    child: ButtonWidgets.menuButton('Play'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
