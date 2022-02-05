import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';

class AssetProvider {
  static const imageAssets = [
    'tile_map/selector.png',
    'tile_map/selector_short.png',
    'tile_map/tiles.png',
    'tile_map/tiles_short.png',
  ];

  static Future<Image> selector(FlameGame game, bool isShort) async => isShort ? _selectorShort(game) : _selector(game);

  static Future<Image> _selector(FlameGame game) async => await game.images.load('tile_map/selector.png');

  static Future<Image> _selectorShort(FlameGame game) async => await game.images.load('tile_map/selector_short.png');

  static Future<Image> tiles(FlameGame game, bool isShort) async => isShort ? _tilesShort(game) : _tiles(game);

  static Future<Image> _tiles(FlameGame game) async => await game.images.load('tile_map/tiles.png');

  static Future<Image> _tilesShort(FlameGame game) async => await game.images.load('tile_map/tiles_short.png');

  static Future<Image> player(FlameGame game) async => await game.images.load('animations/robot-idle.png');
}
