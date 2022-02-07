import 'package:flame/components.dart';
import 'package:water_to_trees/component/animation/plant.dart';
import 'package:water_to_trees/component/sprite/pipe.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/util/app_constants.dart';

class LevelBuilder {
  static const int _rowCount = 4;
  static const int _columnCount = 8;

  Future<List<Component>> wallList() async {
    List<Component> componentList = [];

    double brickSize = AppConstants.wallSize;
    double mostTopLeftBrickX = AppConstants.mostTopLeftWallX;
    double mostTopLeftBrickY = AppConstants.mostTopLeftWallY;

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

    double mostTopLeftTileX = AppConstants.mostTopLeftTileX;
    double mostTopLeftTileY = AppConstants.mostTopLeftTileY;

    componentList.add(Pipe.cornerTopLeft(Vector2(
      mostTopLeftTileX,
      mostTopLeftTileY,
    )));
    componentList.add(Pipe.cornerTopRight(Vector2(
      mostTopLeftTileX + AppConstants.tileSize,
      mostTopLeftTileY,
    )));
    componentList.add(Pipe.cornerBottomLeft(Vector2(
      mostTopLeftTileX,
      mostTopLeftTileY + AppConstants.tileSize,
    )));
    componentList.add(Pipe.cornerBottomRight(Vector2(
      mostTopLeftTileX + AppConstants.tileSize,
      mostTopLeftTileY + AppConstants.tileSize,
    )));
    componentList.add(Pipe.horizontal(Vector2(
      mostTopLeftTileX + AppConstants.tileSize * 2,
      mostTopLeftTileY + AppConstants.tileSize,
    )));
    componentList.add(Pipe.horizontal(Vector2(
      mostTopLeftTileX + AppConstants.tileSize * 2,
      mostTopLeftTileY + AppConstants.tileSize * 3,
    )));
    componentList.add(Plant.carnivorous(Vector2(
      mostTopLeftTileX + AppConstants.tileSize * 5,
      mostTopLeftTileY + AppConstants.tileSize * 3,
    )));

    return componentList;
  }
}
