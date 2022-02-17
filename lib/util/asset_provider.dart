import 'package:flame/components.dart';
import 'package:flame/game.dart';

// generator: https://icon-library.com/png/249125.html
// wire: https://www.vecteezy.com/vector-art/1268055-set-of-colorful-copper-wire

class AssetProvider {
  static const String _animationBulbNoLight = 'animation/bulb/bulb_no_light.png';
  static const String _animationBulbWithLight = 'animation/bulb/bulb_with_light.png';
  static const String _animationGenerator = 'animation/generator.png';

  static const String _animationElectricityVertical = 'animation/electricity/vertical_electricity.png';
  static const String _animationElectricityHorizontal = 'animation/electricity/horizontal_electricity.png';
  static const String _imageBackground = 'background.png';
  static const String _imageWallUnit = 'wall/wall_unit.png';
  static const String _imageWireHorizontal = 'wire/wire_horizontal.png';
  static const String _imageWireVertical = 'wire/wire_vertical.png';
  static const String _imageWireCornerBottomLeft = 'wire/wire_corner_bottom_left.png';
  static const String _imageWireCornerBottomRight = 'wire/wire_corner_bottom_right.png';
  static const String _imageWireCornerTopLeft = 'wire/wire_corner_top_left.png';
  static const String _imageWireCornerTopRight = 'wire/wire_corner_top_right.png';
  static const String _imageWireConnected3Left = 'wire/wire_connected_3_left.png';
  static const String _imageWireConnected3Right = 'wire/wire_connected_3_right.png';
  static const String _imageWireConnected3Bottom = 'wire/wire_connected_3_bottom.png';
  static const String _imageWireConnected3Top = 'wire/wire_connected_3_top.png';
  static const String _imageWireConnected4 = 'wire/wire_connected_4.png';

  static const imageAssets = [
    _animationBulbNoLight,
    _animationBulbWithLight,
    _animationGenerator,
    _imageBackground,
    _imageWallUnit,
    _imageWireHorizontal,
    _imageWireVertical,
    _imageWireCornerBottomLeft,
    _imageWireCornerBottomRight,
    _imageWireCornerTopLeft,
    _imageWireCornerTopRight,
    _imageWireConnected3Left,
    _imageWireConnected3Right,
    _imageWireConnected3Bottom,
    _imageWireConnected3Top,
    _imageWireConnected4,
  ];

  static Future<SpriteAnimation> animationBulbNoLight(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationBulbNoLight,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(600, 600)),
    );
  }

  static Future<SpriteAnimation> animationBulbWithLight(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationBulbWithLight,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(600, 600)),
    );
  }

  static Future<SpriteAnimation> animationGenerator(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationGenerator,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(200, 200)),
    );
  }

  static Future<SpriteAnimation> animationElectricityVertical(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationElectricityVertical,
      SpriteAnimationData.sequenced(amount: 13, stepTime: 0.05, textureSize: Vector2(600, 600)),
    );
  }

  static Future<SpriteAnimation> animationElectricityHorizontal(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationElectricityHorizontal,
      SpriteAnimationData.sequenced(amount: 13, stepTime: 0.5, textureSize: Vector2(600, 600)),
    );
  }

  static Future<Sprite> imageBackground(FlameGame gameRef) async => gameRef.loadSprite(_imageBackground);

  static Future<Sprite> imageWallUnit(FlameGame gameRef) async => gameRef.loadSprite(_imageWallUnit);

  static Future<Sprite> imageWireHorizontal(FlameGame gameRef) async => gameRef.loadSprite(_imageWireHorizontal);

  static Future<Sprite> imageWireVertical(FlameGame gameRef) async => gameRef.loadSprite(_imageWireVertical);

  static Future<Sprite> imageWireCornerBottomLeft(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerBottomLeft);

  static Future<Sprite> imageWireCornerBottomRight(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerBottomRight);

  static Future<Sprite> imageWireCornerTopLeft(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerTopLeft);

  static Future<Sprite> imageWireCornerTopRight(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerTopRight);

  static Future<Sprite> imageWireConnected3Left(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Left);

  static Future<Sprite> imageWireConnected3Right(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Right);

  static Future<Sprite> imageWireConnected3Bottom(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Bottom);

  static Future<Sprite> imageWireConnected3Top(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Top);

  static Future<Sprite> imageWireConnected4(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected4);
}
