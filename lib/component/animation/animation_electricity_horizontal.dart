import 'package:flame/components.dart';
import 'package:light_it_up/component/base_sprite_animation_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class AnimationElectricityHorizontal extends BaseSpriteAnimationComponent {
  AnimationElectricityHorizontal._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: AppConstants.electricityHorizontalSize,
          priority: AppConstants.animationPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationElectricityHorizontal create(Vector2 position) => AnimationElectricityHorizontal._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationElectricityHorizontal,
      );
}
