import 'package:flame/components.dart';
import 'package:water_to_trees/component/base_sprite_animation_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Tile extends BaseSpriteAnimationComponent {
  Tile._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.tileSize),
          priority: AppConstants.tilePriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static Tile carnivorous(Vector2 position) => Tile._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationCarnivorousPlant,
      );

  static Tile generator(Vector2 position) => Tile._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationGenerator,
      );
}
