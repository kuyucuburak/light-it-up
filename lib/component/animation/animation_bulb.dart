import 'package:flame/components.dart';
import 'package:light_it_up/component/base_sprite_animation_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class AnimationBulb extends BaseSpriteAnimationComponent {
  AnimationBulb._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.animationSize),
          priority: AppConstants.animationPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationBulb create(Vector2 position) => AnimationBulb._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationBulbNoLight,
      );

  void turnOnTheLight() {
    spriteAnimationLoader = AssetProvider.animationBulbWithLight;
  }

  void turnOffTheLight() {
    spriteAnimationLoader = AssetProvider.animationBulbNoLight;
  }
}
