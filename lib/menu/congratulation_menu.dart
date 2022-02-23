import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/menu/main_menu.dart';
import 'package:light_it_up/util/asset_provider.dart';
import 'package:light_it_up/widget/button_widgets.dart';

class CongratulationMenu extends StatelessWidget {
  static const id = 'CongratulationMenu';

  final PuzzleGame gameRef;

  const CongratulationMenu(this.gameRef, {Key? key}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  const Text(
                    'Congratulations',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  gameRef.gameController.hasNextLevel
                      ? ElevatedButton(
                          onPressed: () {
                            gameRef.overlays.remove(CongratulationMenu.id);
                            gameRef.overlays.add(Hud.id);
                            gameRef.resumeEngine();
                            gameRef.gameController.nextLevel();
                            gameRef.gameController.startGamePlay();
                            AssetProvider.soundBackgroundInGame();
                          },
                          child: ButtonWidgets.menuButton('Next Level'),
                        )
                      : Container(),
                  ElevatedButton(
                    onPressed: () {
                      gameRef.overlays.remove(CongratulationMenu.id);
                      gameRef.overlays.add(MainMenu.id);
                      gameRef.resumeEngine();
                      gameRef.gameController.removeAllGameComponents(resetGameProgress: true);
                      AssetProvider.soundBackgroundMenu();
                    },
                    child: ButtonWidgets.menuButton('Exit'),
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
