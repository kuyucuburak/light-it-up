import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:water_to_trees/game/puzzle_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  // runApp(GameWidget(game: PuzzleGameOld()));
  runApp(GameWidget(game: IsometricTileMapExample()));
}
