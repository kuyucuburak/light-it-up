import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:light_it_up/component/base_sprite_component.dart';
import 'package:light_it_up/util/alias.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';

class Wall extends BaseSpriteComponent {
  Wall._({
    required Vector2 position,
    required SpriteLoader spriteLoader,
  }) : super(
          position: position,
          size: Vector2.all(AppConstants.wallSize),
          priority: AppConstants.wallPriority,
          spriteLoader: spriteLoader,
        );

  static Wall unit(Vector2 position) => Wall._(
        position: position,
        spriteLoader: AssetProvider.imageWallUnit,
      );
}
