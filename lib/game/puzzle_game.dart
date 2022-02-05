import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';

class IsometricTileMapExample extends FlameGame with MouseMovementDetector {
  static const double _scale = 4.0;
  static const double _srcTileSize = 32.0;
  static const double _destTileSize = _scale * _srcTileSize;

  static const _useShortTiles = false;
  static const _tileHeight = _scale * (_useShortTiles ? 8.0 : 16.0);
  static const _suffix = _useShortTiles ? '-short' : '';

  final topLeft = Vector2(500, 250);
  final originColor = Paint()..color = const Color(0xFFFF00FF);
  final originColor2 = Paint()..color = const Color(0xFFAA55FF);

  late IsometricTileMapComponent _tileMap;
  late Selector selector;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final Image tilesetImage = await images.load('tile_map/tiles$_suffix.png');
    final SpriteSheet tileset = SpriteSheet(
      image: tilesetImage,
      srcSize: Vector2.all(_srcTileSize),
    );
    final matrix = [
      [3, 1, 1, 1, 0, 0],
      [-1, 1, 2, 1, 0, 0],
      [-1, 0, 1, 1, 0, 0],
      [-1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 0, 2],
      [1, 3, 3, 3, 0, 2],
    ];
    add(
      _tileMap = IsometricTileMapComponent(
        tileset,
        matrix,
        destTileSize: Vector2.all(_destTileSize),
        tileHeight: _tileHeight,
        position: topLeft,
      ),
    );

    final selectorImage = await images.load('tile_map/selector$_suffix.png');
    add(selector = Selector(_destTileSize, selectorImage));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.renderPoint(topLeft, size: 5, paint: originColor);
    canvas.renderPoint(
      topLeft.clone()..y -= _tileHeight,
      size: 5,
      paint: originColor2,
    );
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    final screenPosition = info.eventPosition.game;
    final block = _tileMap.getBlock(screenPosition);
    selector.show = _tileMap.containsBlock(block);
    selector.position.setFrom(topLeft + _tileMap.getBlockRenderPosition(block));
  }
}

class Selector extends SpriteComponent {
  bool show = true;

  Selector(double s, Image image)
      : super(
          sprite: Sprite(image, srcSize: Vector2.all(32.0)),
          size: Vector2.all(s),
        );

  @override
  void render(Canvas canvas) {
    if (!show) {
      return;
    }

    super.render(canvas);
  }
}
