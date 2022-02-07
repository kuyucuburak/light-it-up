import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AssetProvider {
  static const String _animationCarnivorousPlant = 'animations/carnivorous_plant.png';

  static const String _imagePipeCornerBottomLeft = 'pipe/pipe_corner_bottom_left.png';
  static const String _imagePipeCornerBottomRight = 'pipe/pipe_corner_bottom_right.png';
  static const String _imagePipeCornerTopLeft = 'pipe/pipe_corner_top_left.png';
  static const String _imagePipeCornerTopRight = 'pipe/pipe_corner_top_right.png';
  static const String _imagePipeHorizontal = 'pipe/pipe_horizontal.png';
  static const String _imagePipeVertical = 'pipe/pipe_vertical.png';
  static const String _imageBrick = 'wall/brick.png';

  static const imageAssets = [
    _animationCarnivorousPlant,
    _imagePipeCornerBottomLeft,
    _imagePipeCornerBottomRight,
    _imagePipeCornerTopLeft,
    _imagePipeCornerTopRight,
    _imagePipeHorizontal,
    _imagePipeVertical,
    _imageBrick,
  ];

  static Future<SpriteAnimation> animationCarnivorousPlant(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationCarnivorousPlant,
      SpriteAnimationData.sequenced(amount: 37, stepTime: 0.025, textureSize: Vector2(136, 173)),
    );
  }

  static Future<Sprite> imagePipeCornerBottomLeft(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeCornerBottomLeft);

  static Future<Sprite> imagePipeCornerBottomRight(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeCornerBottomRight);

  static Future<Sprite> imagePipeCornerTopLeft(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeCornerTopLeft);

  static Future<Sprite> imagePipeCornerTopRight(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeCornerTopRight);

  static Future<Sprite> imagePipeHorizontal(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeHorizontal);

  static Future<Sprite> imagePipeVertical(FlameGame gameRef) async => gameRef.loadSprite(_imagePipeVertical);

  static Future<Sprite> imageBrick(FlameGame gameRef) async => gameRef.loadSprite(_imageBrick);
}
