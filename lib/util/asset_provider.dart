import 'package:flame/components.dart';
import 'package:flame/game.dart';

// brick: https://opengameart.org/content/brick-wall
// fountain: https://opengameart.org/content/solarus-fountain
// wire: https://www.vecteezy.com/vector-art/1268055-set-of-colorful-copper-wire

class AssetProvider {
  static const String _animationCarnivorousPlant = 'animations/carnivorous_plant.png';
  static const String _animationFountain = 'animations/fountain.png';

  static const String _imageBrick = 'wall/brick.png';
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
    _animationCarnivorousPlant,
    _animationFountain,
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

  static Future<SpriteAnimation> animationCarnivorousPlant(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationCarnivorousPlant,
      SpriteAnimationData.sequenced(amount: 37, stepTime: 0.025, textureSize: Vector2(136, 173)),
    );
  }

  static Future<SpriteAnimation> animationFountain(FlameGame gameRef) async {
    return await gameRef.loadSpriteAnimation(
      _animationFountain,
      SpriteAnimationData.sequenced(amount: 6, stepTime: 0.2, textureSize: Vector2(56, 55)),
    );
  }

  static Future<Sprite> imageBrick(FlameGame gameRef) async => gameRef.loadSprite(_imageBrick);

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
