import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/congratulation_menu.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/menu/main_menu.dart';
import 'package:light_it_up/menu/pause_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
    GameWidget(
      overlayBuilderMap: {
        MainMenu.id: (_, PuzzleGame gameRef) => MainMenu(gameRef),
        PauseMenu.id: (_, PuzzleGame gameRef) => PauseMenu(gameRef),
        CongratulationMenu.id: (_, PuzzleGame gameRef) => CongratulationMenu(gameRef),
        Hud.id: (_, PuzzleGame gameRef) => Hud(gameRef),
      },
      initialActiveOverlays: const [MainMenu.id],
      game: PuzzleGame(),
    ),
  );
}
