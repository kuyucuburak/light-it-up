import 'package:flame/components.dart';
import 'package:water_to_trees/component/animation/tile.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/util/app_constants.dart';

import '../component/sprite/wire.dart';

class LevelBuilder {
  static const String ntg = "nothing";
  static const String gnr = "generator";
  static const String bnl = "bulb_no_light";
  static const String bwl = "bulb_with_light";
  static const String wbl = "wire_bottom_left";
  static const String wbr = "wire_bottom_right";
  static const String wtl = "wire_top_left";
  static const String wtr = "wire_top_right";
  static const String wct = "wire_connected3_top";
  static const String wcb = "wire_connected3_bottom";
  static const String wcl = "wire_connected3_left";
  static const String wcr = "wire_connected3_right";
  static const String who = "wire_horizontal";
  static const String wve = "wire_vertical";
  static const String wc4 = "wire_connected4";

  late final double _mostTopLeftBrickX = AppConstants.mostTopLeftTileX - AppConstants.tileSize / 2 - AppConstants.wallSize / 2;
  late final double _mostTopLeftBrickY = AppConstants.mostTopLeftTileY - AppConstants.tileSize / 2 - AppConstants.wallSize / 2;
  late final int _tileRowCount = _tileMap.length;
  late final int _tileColumnCount = _tileMap[0].length;
  late final int _brickRowCount = _tileRowCount * AppConstants.tileSize ~/ AppConstants.wallSize + 2;
  late final int _brickColumnCount = _tileColumnCount * AppConstants.tileSize ~/ AppConstants.wallSize + 2;

  final List<List<String>> _tileMap;

  LevelBuilder(this._tileMap);

  Future<List<Component>> wallList() async {
    List<Component> componentList = [];

    double wallSize = AppConstants.wallSize;
    int rowCount = _brickRowCount;
    int columnCount = _brickColumnCount;

    // top bricks
    for (int i = 0; i < columnCount; i++) {
      componentList.add(Wall.brick(Vector2(
        _mostTopLeftBrickX + (i * wallSize),
        _mostTopLeftBrickY,
      )));
    }

    // bottom bricks
    for (int i = 0; i < columnCount; i++) {
      componentList.add(Wall.brick(Vector2(
        _mostTopLeftBrickX + (i * wallSize),
        _mostTopLeftBrickY + (wallSize * (rowCount - 1)),
      )));
    }

    // left bricks
    for (int i = 1; i < rowCount - 1; i++) {
      componentList.add(Wall.brick(Vector2(
        _mostTopLeftBrickX,
        _mostTopLeftBrickY + (i * wallSize),
      )));
    }

    // right bricks
    for (int i = 1; i < rowCount - 1; i++) {
      componentList.add(Wall.brick(Vector2(
        _mostTopLeftBrickX + wallSize * (columnCount - 1),
        _mostTopLeftBrickY + (i * wallSize),
      )));
    }

    return componentList;
  }

  Future<List<Component>> tileList() async {
    List<Component> componentList = [];

    for (int i = 0; i < _tileRowCount; i++) {
      for (int j = 0; j < _tileColumnCount; j++) {
        String key = _tileMap[i][j];
        double positionX = AppConstants.mostTopLeftTileX + AppConstants.tileSize * j;
        double positionY = AppConstants.mostTopLeftTileY + AppConstants.tileSize * i;
        Component? component = _keyToComponent(key, Vector2(positionX, positionY));
        if (component != null) {
          componentList.add(component);
        }
      }
    }

    return componentList;
  }

  Future<List<Component>> animationList() async {
    List<Component> componentList = [];
    componentList.add(_keyToComponent(gnr, Vector2(AppConstants.mostTopLeftTileX - AppConstants.tileSize * 0.75, AppConstants.mostTopLeftTileY))!);
    return componentList;
  }

  Future<List<Component>> bulbList() async {
    List<Component> componentList = [];
    componentList.add(_keyToComponent(
        bnl,
        Vector2(AppConstants.mostTopLeftTileX + (_tileColumnCount - 1) * AppConstants.tileSize + AppConstants.tileSize * 0.75,
            AppConstants.mostTopLeftTileY + (_tileRowCount - 1) * AppConstants.tileSize))!);

    componentList.add(_keyToComponent(
        bwl,
        Vector2(AppConstants.mostTopLeftTileX + (_tileColumnCount - 1) * AppConstants.tileSize + AppConstants.tileSize * 0.75,
            AppConstants.mostTopLeftTileY + (_tileRowCount - 4) * AppConstants.tileSize))!);
    return componentList;
  }

  Component? _keyToComponent(String key, Vector2 position) {
    switch (key) {
      case gnr:
        return Tile.generator(position);
      case bnl:
        return Tile.bulbNoLight(position);
      case bwl:
        return Tile.bulbWithLight(position);
      case wbl:
        return Wire.cornerBottomLeft(position);
      case wbr:
        return Wire.cornerBottomRight(position);
      case wtl:
        return Wire.cornerTopLeft(position);
      case wtr:
        return Wire.cornerTopRight(position);
      case wct:
        return Wire.connected3Top(position);
      case wcb:
        return Wire.connected3Bottom(position);
      case wcl:
        return Wire.connected3Left(position);
      case wcr:
        return Wire.connected3Right(position);
      case who:
        return Wire.horizontal(position);
      case wve:
        return Wire.vertical(position);
      case wc4:
        return Wire.connected4(position);
      default:
        return null;
    }
  }
}
