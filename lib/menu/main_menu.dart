import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/util/asset_provider.dart';
import 'package:light_it_up/widget/button_widgets.dart';

class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';

  final PuzzleGame gameRef;

  const MainMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 500,
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
                  ButtonWidgets.animatedButtonText('Light It Up'),
                  ButtonWidgets.animatedButtonText('Play', fontSize: 48, isAnimating: false, onTap: () {
                    gameRef.gameController.startGamePlay();
                    gameRef.overlays.add(Hud.id);
                    gameRef.overlays.remove(MainMenu.id);
                    AssetProvider.bgmGame();
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
