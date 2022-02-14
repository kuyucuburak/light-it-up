import 'package:flame/components.dart';
import 'package:flame/game.dart';

// brick: https://opengameart.org/content/brick-wall
// generator: https://icon-library.com/png/249125.html
// wire: https://www.vecteezy.com/vector-art/1268055-set-of-colorful-copper-wire

class AssetProvider {
  static const String _animationGenerator = 'animations/power_generator.png';
  static const String _animationBulbWithLight = 'bulb/bulb_with_light.png';
  static const String _animationBulbNoLight = 'bulb/bulb_no_light.png';

  static const String _imageBackground = 'wall/background.png';
  static const String _imageBrick = 'wall/brick.png';
  static const String _imageBulbNoLight = 'bulb/bulb_no_light.png';
  static const String _imageBulbWithLight = 'bulb/bulb_with_light.png';
  static const String _imageWireCornerBottomLeft = 'wire/wire_corner_bottom_left.png';
  static const String _imageWireCornerBottomRight = 'wire/wire_corner_bottom_right.png';
  static const String _imageWireCornerTopLeft = 'wire/wire_corner_top_left.png';
  static const String _imageWireCornerTopRight = 'wire/wire_corner_top_right.png';
  static const String _imageWireConnected3Top = 'wire/wire_3connected_top.png';
  static const String _imageWireConnected3Bottom = 'wire/wire_3connected_bottom.png';
  static const String _imageWireConnected3Left = 'wire/wire_3connected_left.png';
  static const String _imageWireConnected3Right = 'wire/wire_3connected_right.png';
  static const String _imageWireHorizontal = 'wire/wire_horizontal.png';
  static const String _imageWireVertical = 'wire/wire_vertical.png';
  static const String _imageWire4connected = 'wire/wire_4connected.png';

  static const imageAssets = [
    _imageBackground,
    _imageBulbNoLight,
    _imageBulbWithLight,
    _animationGenerator,
    _animationBulbWithLight,
    _animationBulbNoLight,
    _imageWireCornerBottomLeft,
    _imageWireCornerBottomRight,
    _imageWireCornerTopLeft,
    _imageWireCornerTopRight,
    _imageWireConnected3Top,
    _imageWireConnected3Bottom,
    _imageWireConnected3Left,
    _imageWireConnected3Right,
    _imageWireHorizontal,
    _imageWireVertical,
    _imageWire4connected,
  ];

  static Future<SpriteAnimation> animationGenerator(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationGenerator,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(200, 200)),
    );
  }

  static Future<SpriteAnimation> animationBulbWithLight(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationBulbWithLight,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(600, 600)),
    );
  }

  static Future<SpriteAnimation> animationBulbNoLight(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationBulbNoLight,
      SpriteAnimationData.sequenced(amount: 20, stepTime: 0.1, textureSize: Vector2(600, 600)),
    );
  }

  static Future<Sprite> imageBackground(FlameGame gameRef) async => gameRef.loadSprite(_imageBackground);

  static Future<Sprite> imageBrick(FlameGame gameRef) async => gameRef.loadSprite(_imageBrick);

  static Future<Sprite> imageBulbNoLight(FlameGame gameRef) async => gameRef.loadSprite(_imageBulbNoLight);

  static Future<Sprite> imageBulbWithLight(FlameGame gameRef) async => gameRef.loadSprite(_imageBulbWithLight);

  static Future<Sprite> imageWireCornerBottomLeft(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerBottomLeft);

  static Future<Sprite> imageWireCornerBottomRight(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerBottomRight);

  static Future<Sprite> imageWireCornerTopLeft(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerTopLeft);

  static Future<Sprite> imageWireCornerTopRight(FlameGame gameRef) async => gameRef.loadSprite(_imageWireCornerTopRight);

  static Future<Sprite> imageWire3connectedTop(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Top);

  static Future<Sprite> imageWire3connectedBottom(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Bottom);

  static Future<Sprite> imageWire3connectedLeft(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Left);

  static Future<Sprite> imageWire3connectedRight(FlameGame gameRef) async => gameRef.loadSprite(_imageWireConnected3Right);

  static Future<Sprite> imageWireHorizontal(FlameGame gameRef) async => gameRef.loadSprite(_imageWireHorizontal);

  static Future<Sprite> imageWireVertical(FlameGame gameRef) async => gameRef.loadSprite(_imageWireVertical);

  static Future<Sprite> imageWire4connected(FlameGame gameRef) async => gameRef.loadSprite(_imageWire4connected);
}
