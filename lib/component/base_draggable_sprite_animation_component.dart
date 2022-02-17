import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart' as material;
import 'package:light_it_up/component/base_draggable.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';

class BaseDraggableSpriteAnimationComponent extends SpriteAnimationComponent with HasGameRef<PuzzleGame>, HasHitboxes, Draggable, BaseDraggable {
  @override
  material.Color debugColor = material.Colors.greenAccent;

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
}
