import 'package:flame/components.dart';
import 'package:light_it_up/component/base_sprite_animation_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class AnimationElectricityVertical extends BaseSpriteAnimationComponent {
  AnimationElectricityVertical._({
    required Vector2 position,
    required SpriteAnimationLoader spriteAnimationLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.electricitySize),
          priority: AppConstants.animationPriority,
          spriteAnimationLoader: spriteAnimationLoader,
        );

  static AnimationElectricityVertical create(Vector2 position) => AnimationElectricityVertical._(
        position: position,
        spriteAnimationLoader: AssetProvider.animationElectricityVertical,
      );
}
