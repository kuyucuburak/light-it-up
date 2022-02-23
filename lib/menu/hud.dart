import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/pause_menu.dart';
import 'package:light_it_up/util/asset_provider.dart';

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
              FlameAudio.bgm.stop();
              AssetProvider.soundBackgroundMenu();
            },
            child: const Icon(
              Icons.pause,
              color: Colors.white,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }
}
