import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:light_it_up/game/puzzle_game.dart';

import 'menu/game_over_menu.dart';
import 'menu/main_menu.dart';
import 'menu/pause_menu.dart';

PuzzleGame _puzzleGame = PuzzleGame();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
    GameWidget(
      overlayBuilderMap: {
        MainMenu.id: (_, PuzzleGame gameRef) => MainMenu(gameRef),
        PauseMenu.id: (_, PuzzleGame gameRef) => PauseMenu(gameRef),
        GameOverMenu.id: (_, PuzzleGame gameRef) => GameOverMenu(gameRef),
      },
      initialActiveOverlays: const [MainMenu.id],
      game: _puzzleGame,
    ),
  );
}
