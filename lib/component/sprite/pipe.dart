import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_draggable_sprite_component.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Pipe extends BaseDraggableSpriteComponent {
  Pipe._({
    required Vector2 position,
    required spriteLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.tileSize),
          priority: AppConstants.tilePriority,
          spriteLoader: spriteLoader,
        );

  static Pipe cornerBottomLeft(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeCornerBottomLeft,
      );

  static Pipe cornerBottomRight(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeCornerBottomRight,
      );

  static Pipe cornerTopLeft(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeCornerTopLeft,
      );

  static Pipe cornerTopRight(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeCornerTopRight,
      );

  static Pipe horizontal(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeHorizontal,
      );

  static Pipe vertical(Vector2 position) => Pipe._(
        position: position,
        spriteLoader: AssetProvider.imagePipeVertical,
      );
}
