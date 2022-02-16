import 'package:flame/components.dart';
import 'package:water_to_trees/component/base_sprite_animation_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class AnimationGenerator extends BaseSpriteAnimationComponent {
  AnimationGenerator._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.animationSize),
          priority: AppConstants.animationPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationGenerator create(Vector2 position) => AnimationGenerator._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationGenerator,
      );
}
