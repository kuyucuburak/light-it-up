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
      child: SizedBox(
        height: 300,
        width: 350,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.black.withAlpha(100),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  ButtonWidgets.animatedButtonText('Congratulations!', fontSize: 16),
                  const SizedBox(height: 16),
                  gameRef.gameController.hasNextLevel
                      ? ButtonWidgets.animatedButtonText('Next Level', fontSize: 24, isAnimating: false, onTap: () {
                          gameRef.overlays.remove(CongratulationMenu.id);
                          gameRef.overlays.add(Hud.id);
                          gameRef.resumeEngine();
                          gameRef.gameController.nextLevel();
                          gameRef.gameController.startGamePlay();
                          AssetProvider.soundBgmGame();
                        })
                      : Container(),
                  ButtonWidgets.animatedButtonText('Exit', isAnimating: false, fontSize: 24, onTap: () {
                    gameRef.overlays.remove(CongratulationMenu.id);
                    gameRef.overlays.add(MainMenu.id);
                    gameRef.resumeEngine();
                    gameRef.gameController.removeAllGameComponents(resetGameProgress: true);
                    AssetProvider.soundBgmMenu();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
