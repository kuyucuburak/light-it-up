import 'package:flame/components.dart';
import 'package:light_it_up/data/level.dart';
import 'package:light_it_up/game/level_builder.dart';

class LevelController {
  late final List<Level> levelList = [_level1, _level2, _level3, _level4, _level5];
  late Level _currentLevel = _level1;
  late LevelBuilder _levelBuilder = LevelBuilder(_currentLevel);

  final Level _level1 = Level(
    tileMap: [
      [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
    ],
    generatorIndexList: [0, 1, 2, 3, 4],
    bulbIndexList: [0, 1, 2, 3, 4],
  );

  final Level _level2 = Level(
    tileMap: [
      [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [2],
  );

  final Level _level3 = Level(
    tileMap: [
      [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [1, 5],
  );

  final Level _level4 = Level(
    tileMap: [
      [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [2, 6],
  );

  final Level _level5 = Level(
    tileMap: [
      [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
      [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [2, 4],
  );

  void nextLevel() {
    int indexOfNextLevel = levelList.indexOf(_currentLevel) + 1;
    _currentLevel = levelList[indexOfNextLevel];
    _levelBuilder = LevelBuilder(_currentLevel);
  }

  List<Component> get currentLevelComponentList => _levelBuilder.levelComponents;

  int get wireRowCount => _levelBuilder.wireRowCount;

  int get wireColumnCount => _levelBuilder.wireColumnCount;

  bool get hasNextLevel => levelList.indexOf(_currentLevel) == (levelList.length - 1);
}
