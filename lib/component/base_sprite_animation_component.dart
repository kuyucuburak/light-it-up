import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';

class BaseSpriteAnimationComponent extends SpriteAnimationComponent with HasGameRef<PuzzleGame>, HasHitboxes {
  @override
  bool debugMode = AppConstants.debugMode;
  @override
  Color debugColor = Colors.yellowAccent;

  final SpriteAnimationLoader spriteAnimationLoader;

  BaseSpriteAnimationComponent({
    required Vector2 position,
    required Vector2 size,
    required int priority,
    required this.spriteAnimationLoader,
  }) : super(
          position: position,
          size: size,
          priority: priority,
          anchor: AppConstants.anchor,
        ) {
    addHitbox(HitboxRectangle());
  }

  @mustCallSuper
  @override
  Future<void> onLoad() async {
    super.onLoad();
    animation = await spriteAnimationLoader(gameRef);
  }
}
