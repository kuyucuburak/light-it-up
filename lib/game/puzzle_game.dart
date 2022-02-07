import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/sprite/pipe.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables, HasCollidables {
  final int _rowCount = 4;
  final int _columnCount = 8;

  final double _brickSize = 100;
  final double _mostTopLeftBrickX = 250;
  final double _mostTopLeftBrickY = 250;

  final double chopperSize = 100;
  final double _mostTopLeftChopperX = 350;
  final double _mostTopLeftChopperY = 350;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    _buildWalls();
    _buildPipes();
  }

  Future<void> _buildWalls() async {
    // top (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(Wall.brick(Vector2(
        _mostTopLeftBrickX + (i * _brickSize),
        _mostTopLeftBrickY,
      )));
    }

    // bottom (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(Wall.brick(Vector2(
        _mostTopLeftBrickX + (i * _brickSize),
        _mostTopLeftBrickY + (_brickSize * (_rowCount + 1)),
      )));
    }

    // left _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(Wall.brick(Vector2(
        _mostTopLeftBrickX,
        _mostTopLeftBrickY + ((i + 1) * _brickSize),
      )));
    }

    // right _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(Wall.brick(Vector2(
        _mostTopLeftBrickX + _brickSize * (_columnCount + 1),
        _mostTopLeftBrickY + ((i + 1) * _brickSize),
      )));
    }
  }

  Future<void> _buildPipes() async {
    add(Pipe.cornerTopLeft(Vector2(
      _mostTopLeftChopperX,
      _mostTopLeftChopperY,
    )));
    add(Pipe.cornerTopRight(Vector2(
      _mostTopLeftChopperX + AppConstants.pipeSize,
      _mostTopLeftChopperY,
    )));
    add(Pipe.cornerBottomLeft(Vector2(
      _mostTopLeftChopperX,
      _mostTopLeftChopperY + AppConstants.pipeSize,
    )));
    add(Pipe.cornerBottomRight(Vector2(
      _mostTopLeftChopperX + AppConstants.pipeSize,
      _mostTopLeftChopperY + AppConstants.pipeSize,
    )));
    add(Pipe.horizontal(Vector2(
      _mostTopLeftChopperX + AppConstants.pipeSize * 2,
      _mostTopLeftChopperY + AppConstants.pipeSize,
    )));
    add(Pipe.horizontal(Vector2(
      _mostTopLeftChopperX + AppConstants.pipeSize * 2,
      _mostTopLeftChopperY + AppConstants.pipeSize * 3,
    )));
  }
}
