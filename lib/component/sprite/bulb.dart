import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_sprite_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Bulb extends BaseSpriteComponent {
  Bulb._({
    required Vector2 position,
    required SpriteLoader spriteLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.tileSize),
          priority: AppConstants.animationPriority,
          spriteLoader: spriteLoader,
        );

  static Bulb noLight(Vector2 position) => Bulb._(
        position: position,
        spriteLoader: AssetProvider.imageBulbNoLight,
      );

  static Bulb withLight(Vector2 position) => Bulb._(
        position: position,
        spriteLoader: AssetProvider.imageBulbWithLight,
      );
}
