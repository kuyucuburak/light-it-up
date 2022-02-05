import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AssetProvider {
  static const String _animationChopper = 'animations/chopper.png';

  static const String _imageWall = 'wall.png';

  static const imageAssets = [
    _animationChopper,
    _imageWall,
  ];

  static Future<SpriteAnimation> animationChopper(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationChopper,
      SpriteAnimationData.sequenced(amount: 4, stepTime: 0.1, textureSize: Vector2.all(48)),
    );
  }

  static Future<Sprite> imageWall(FlameGame gameRef) async => gameRef.loadSprite(_imageWall);
}
