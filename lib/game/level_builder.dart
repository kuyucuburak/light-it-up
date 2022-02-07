import 'package:flame/components.dart';
import 'package:water_to_trees/component/animation/plant.dart';
import 'package:water_to_trees/component/sprite/pipe.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/util/app_constants.dart';

class LevelBuilder {
  static const String ntg = "nothing";
  static const String lnt = "plant";
  static const String pbl = "pipe bottom left";
  static const String pbr = "pipe bottom right";
  static const String ptl = "pipe top left";
  static const String ptr = "pipe top right";
  static const String pho = "pipe horizontal";
  static const String pve = "pipe vertical";

  static const double _mostTopLeftTileX = 350;
  static const double _mostTopLeftTileY = 350;
  static const double _mostTopLeftWallX = 250;
  static const double _mostTopLeftWallY = 250;

  final List<List<String>> _tileMap;

  late final int _rowCount;
  late final int _columnCount;

  LevelBuilder(this._tileMap) {
    _rowCount = _tileMap.length;
    _columnCount = _tileMap[0].length;
  }

  Future<List<Component>> wallList() async {
    List<Component> componentList = [];

    double brickSize = AppConstants.wallSize;
    double mostTopLeftBrickX = _mostTopLeftWallX;
    double mostTopLeftBrickY = _mostTopLeftWallY;

    // top (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      componentList.add(Wall.brick(Vector2(
        mostTopLeftBrickX + (i * brickSize),
        mostTopLeftBrickY,
      )));
    }

    // bottom (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      componentList.add(Wall.brick(Vector2(
        mostTopLeftBrickX + (i * brickSize),
        mostTopLeftBrickY + (brickSize * (_rowCount + 1)),
      )));
    }

    // left _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      componentList.add(Wall.brick(Vector2(
        mostTopLeftBrickX,
        mostTopLeftBrickY + ((i + 1) * brickSize),
      )));
    }

    // right _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      componentList.add(Wall.brick(Vector2(
        mostTopLeftBrickX + brickSize * (_columnCount + 1),
        mostTopLeftBrickY + ((i + 1) * brickSize),
      )));
    }

    return componentList;
  }

  Future<List<Component>> tileList() async {
    List<Component> componentList = [];

    for (int i = 0; i < _rowCount; i++) {
      for (int j = 0; j < _columnCount; j++) {
        String key = _tileMap[i][j];
        double positionX = _mostTopLeftTileX + AppConstants.tileSize * j;
        double positionY = _mostTopLeftTileY + AppConstants.tileSize * i;
        Component? component = keyToComponent(key, Vector2(positionX, positionY));
        if (component != null) {
          componentList.add(component);
        }
      }
    }

    return componentList;
  }

  Component? keyToComponent(String key, Vector2 position) {
    switch (key) {
      case lnt:
        return Plant.carnivorous(position);
      case pbl:
        return Pipe.cornerBottomLeft(position);
      case pbr:
        return Pipe.cornerBottomRight(position);
      case ptl:
        return Pipe.cornerTopLeft(position);
      case ptr:
        return Pipe.cornerTopRight(position);
      case pho:
        return Pipe.horizontal(position);
      case pve:
        return Pipe.vertical(position);
      default:
        return null;
    }
  }
}
