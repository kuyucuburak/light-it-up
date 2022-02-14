import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_draggable_sprite_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Wire extends BaseDraggableSpriteComponent {
  Wire._({
    required Vector2 position,
    required SpriteLoader spriteLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.wireSize),
          priority: AppConstants.wirePriority,
          spriteLoader: spriteLoader,
        );

  static Wire horizontal(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireHorizontal,
      );

  static Wire vertical(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireVertical,
      );

  static Wire cornerBottomLeft(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireCornerBottomLeft,
      );

  static Wire cornerBottomRight(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireCornerBottomRight,
      );

  static Wire cornerTopLeft(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireCornerTopLeft,
      );

  static Wire cornerTopRight(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireCornerTopRight,
      );

  static Wire connected3Left(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireConnected3Left,
      );

  static Wire connected3Right(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireConnected3Right,
      );

  static Wire connected3Bottom(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireConnected3Bottom,
      );

  static Wire connected3Top(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireConnected3Top,
      );

  static Wire connected4(Vector2 position) => Wire._(
        position: position,
        spriteLoader: AssetProvider.imageWireConnected4,
      );
}
