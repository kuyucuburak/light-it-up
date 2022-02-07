import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:water_to_trees/component/base_draggable_sprite.dart';

class Pipe extends BaseDraggableSprite {
  Pipe({
    required Vector2 position,
    required Vector2 size,
    required spriteLoader,
  }) : super(
          position: position,
          size: size,
          priority: 1,
          anchor: Anchor.center,
          spriteLoader: spriteLoader,
        );
}
