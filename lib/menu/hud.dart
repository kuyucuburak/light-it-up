import 'package:flutter/material.dart';
import 'package:light_it_up/menu/pause_menu.dart';

import '../game/puzzle_game.dart';

class Hud extends StatelessWidget {
  static const id = 'Hud';

  final PuzzleGame gameRef;

  const Hud(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              gameRef.overlays.remove(Hud.id);
              gameRef.overlays.add(PauseMenu.id);
              gameRef.pauseEngine();
            },
            child: const Icon(Icons.pause, color: Colors.white, size: 48,),
          ),
        ],
      ),
    );
  }
}
