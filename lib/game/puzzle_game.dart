import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/sprite/pipe.dart';
import 'package:water_to_trees/component/sprite/wall.dart';
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
    _buildChoppers();
  }

  Future<void> _buildWalls() async {
    // top (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(Wall<PuzzleGame>(
        position: Vector2(
          _mostTopLeftBrickX + (i * _brickSize),
          _mostTopLeftBrickY,
        ),
        size: Vector2.all(_brickSize),
      ));
    }

    // bottom (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(Wall<PuzzleGame>(
        position: Vector2(
          _mostTopLeftBrickX + (i * _brickSize),
          _mostTopLeftBrickY + (_brickSize * (_rowCount + 1)),
        ),
        size: Vector2.all(_brickSize),
      ));
    }

    // left _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(Wall<PuzzleGame>(
        position: Vector2(
          _mostTopLeftBrickX,
          _mostTopLeftBrickY + ((i + 1) * _brickSize),
        ),
        size: Vector2.all(_brickSize),
      ));
    }

    // right _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(Wall<PuzzleGame>(
        position: Vector2(
          _mostTopLeftBrickX + _brickSize * (_columnCount + 1),
          _mostTopLeftBrickY + ((i + 1) * _brickSize),
        ),
        size: Vector2.all(_brickSize),
      ));
    }
  }

  Future<void> _buildChoppers() async {
    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX,
        _mostTopLeftChopperY,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeCornerBottomLeft,
    ));

    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX + chopperSize,
        _mostTopLeftChopperY,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeCornerBottomRight,
    ));

    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX,
        _mostTopLeftChopperY + chopperSize,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeCornerTopLeft,
    ));

    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX + chopperSize,
        _mostTopLeftChopperY + chopperSize,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeCornerTopRight,
    ));

    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX + chopperSize * 2,
        _mostTopLeftChopperY,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeHorizontal,
    ));

    add(Pipe(
      position: Vector2(
        _mostTopLeftChopperX,
        _mostTopLeftChopperY + chopperSize * 2,
      ),
      size: Vector2.all(chopperSize),
      spriteLoader: AssetProvider.imagePipeVertical,
    ));
  }
}
