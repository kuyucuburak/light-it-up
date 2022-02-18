import 'package:flame/components.dart';
import 'package:light_it_up/component/base_sprite_animation_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class AnimationElectricity extends BaseSpriteAnimationComponent {
  AnimationElectricity._({
    required Vector2 position,
    required Vector2 size,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: size,
          priority: AppConstants.dynamicAnimationPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationElectricity horizontal(Vector2 position) => AnimationElectricity._(
        position: position,
        size: AppConstants.electricityHorizontalSize,
        spriteAnimationLoader: AssetProvider.animationElectricityHorizontal,
      );

  static AnimationElectricity vertical(Vector2 position) => AnimationElectricity._(
        position: position,
        size: AppConstants.electricityVerticalSize,
        spriteAnimationLoader: AssetProvider.animationElectricityVertical,
      );
}
