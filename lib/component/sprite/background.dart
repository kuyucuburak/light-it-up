import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_sprite_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Background extends BaseSpriteComponent {
  Background._({
    required Vector2 position,
    required Vector2 size,
    required SpriteLoader spriteLoader,
  }) : super(
          position: position,
          size: size,
          priority: AppConstants.backgroundPriority,
          spriteLoader: spriteLoader,
        );

  static Background black({required Vector2 position, required Vector2 size}) => Background._(
        position: position,
        size: size,
        spriteLoader: AssetProvider.imageBackground,
      );
}
