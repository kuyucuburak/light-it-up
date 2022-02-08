import 'package:flame/components.dart';
import 'package:water_to_trees/component/animation/tile.dart';
import 'package:water_to_trees/component/sprite/pipe.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/util/app_constants.dart';

class LevelBuilder {
  static const String ntg = "nothing";
  static const String cnv = "carnivorous";
  static const String fnt = "fountain";
  static const String pbl = "pipe_bottom_left";
  static const String pbr = "pipe_bottom_right";
  static const String ptl = "pipe_top_left";
  static const String ptr = "pipe_top_right";
  static const String pho = "pipe_horizontal";
  static const String pve = "pipe_vertical";

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
      case cnv:
        return Tile.carnivorous(position);
      case fnt:
        return Tile.fountain(position);
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
