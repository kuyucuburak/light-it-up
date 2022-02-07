import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:meta/meta.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Chopper<T extends FlameGame> extends SpriteAnimationComponent with HasGameRef<T> {
  Chopper({
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
          priority: 1,
          anchor: Anchor.center,
        );

  @mustCallSuper
  @override
  Future<void> onLoad() async {
    super.onLoad();
    animation = await AssetProvider.animationPlant(gameRef);
  }
}
