import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:meta/meta.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Wall<T extends FlameGame> extends SpriteComponent with HasGameRef<T>, HasHitboxes, Collidable {
  Wall({
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
          priority: 0,
          anchor: Anchor.center,
        ) {
    addHitbox(HitboxRectangle());
  }

  @mustCallSuper
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await AssetProvider.imageBrick(gameRef);
  }
}
