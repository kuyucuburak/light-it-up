import 'package:flame/components.dart';
import 'package:light_it_up/component/base_sprite_animation_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class AnimationGenerator extends BaseSpriteAnimationComponent {
  AnimationGenerator._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.animationSize),
          priority: AppConstants.constObjectPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationGenerator create(Vector2 position) => AnimationGenerator._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationGenerator,
      );
}
