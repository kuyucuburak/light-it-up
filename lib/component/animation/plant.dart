import 'package:flame/components.dart';
import 'package:water_to_trees/component/base_draggable_sprite_animation_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Plant extends BaseDraggableSpriteAnimationComponent {
  Plant._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.tileSize),
          priority: AppConstants.plantPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static Plant carnivorous(Vector2 position) => Plant._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationCarnivorousPlant,
      );
}
