import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/constants.dart';

class WallGame extends Wall<PuzzleGame> with HasHitboxes, Collidable {
  @override
  bool debugMode = Constants.debugMode;

  WallGame({
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
        ) {
    addHitbox(HitboxRectangle());
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = material.Colors.redAccent;
  }
}
