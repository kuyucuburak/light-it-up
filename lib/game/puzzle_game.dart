import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/game/chopper_game.dart';
import 'package:water_to_trees/component/game/wall_game.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables, HasCollidables {
  late final List<ChopperGame> squareList = [];

  final int _rowCount = 4;
  final int _columnCount = 8;

  final double _brickSize = 100;
  final double _mostTopLeftBrickX = 250;
  final double _mostTopLeftBrickY = 250;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    _buildWalls();

    squareList.add(ChopperGame(position: Vector2(500, 400), size: Vector2.all(_brickSize)));
    squareList.add(ChopperGame(position: Vector2(500, 601), size: Vector2.all(_brickSize)));

    for (ChopperGame e in squareList) {
      add(e);
    }
  }

  Future<void> _buildWalls() async {
    // top (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(WallGame(
        position: Vector2(
          _mostTopLeftBrickX + (i * _brickSize),
          _mostTopLeftBrickY,
        ),
        size: Vector2.all(100),
      ));
    }

    // bottom (_columnCount + 2) bricks
    for (int i = 0; i < (_columnCount + 2); i++) {
      add(WallGame(
        position: Vector2(
          _mostTopLeftBrickX + (i * _brickSize),
          _mostTopLeftBrickY + (_brickSize * (_rowCount + 1)),
        ),
        size: Vector2.all(100),
      ));
    }

    // left _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(WallGame(
        position: Vector2(
          _mostTopLeftBrickX,
          _mostTopLeftBrickY + ((i + 1) * _brickSize),
        ),
        size: Vector2.all(100),
      ));
    }

    // right _rowCount bricks
    for (int i = 0; i < _rowCount; i++) {
      add(WallGame(
        position: Vector2(
          _mostTopLeftBrickX + _brickSize * (_columnCount + 1),
          _mostTopLeftBrickY + ((i + 1) * _brickSize),
        ),
        size: Vector2.all(100),
      ));
    }
  }
}
