import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/component/base_draggable.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';

class BaseDraggableSpriteComponent extends SpriteComponent with HasGameRef<PuzzleGame>, HasHitboxes, Draggable, BaseDraggable {
  @override
  material.Color debugColor = material.Colors.lightBlueAccent;

  final SpriteLoader spriteLoader;

  BaseDraggableSpriteComponent({
    required Vector2 position,
    required Vector2 size,
    required int priority,
    required this.spriteLoader,
  }) : super(
          position: position,
          size: size,
          priority: priority,
          anchor: AppConstants.anchor,
        ) {
    addHitbox(HitboxRectangle());
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await spriteLoader(gameRef);
  }
}
