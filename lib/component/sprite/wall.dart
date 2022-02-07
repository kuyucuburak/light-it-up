import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_collidable_sprite_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Wall extends BaseCollidableSpriteComponent {
  Wall._({
    required Vector2 position,
    required SpriteLoader spriteLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.wallSize),
          priority: AppConstants.wallPriority,
          spriteLoader: spriteLoader,
        );

  static Wall brick(Vector2 position) => Wall._(
        position: position,
        spriteLoader: AssetProvider.imageBrick,
      );
}
