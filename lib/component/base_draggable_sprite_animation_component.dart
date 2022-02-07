import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/component/base_draggable.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';

class BaseDraggableSpriteAnimationComponent extends SpriteAnimationComponent with HasGameRef<PuzzleGame>, HasHitboxes, Collidable, Draggable, BaseDraggable {
  final SpriteAnimationLoader spriteAnimationLoader;

  BaseDraggableSpriteAnimationComponent({
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

  @override
  Future<void> onLoad() async {
    super.onLoad();
    animation = await spriteAnimationLoader(gameRef);
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? material.Colors.greenAccent : material.Colors.lightBlueAccent;
  }
}
