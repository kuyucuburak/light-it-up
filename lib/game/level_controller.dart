import 'package:flame/components.dart';
import 'package:light_it_up/data/level.dart';
import 'package:light_it_up/game/level_builder.dart';

class LevelController {
  late final List<Level> _levelList = [_level1, _level2, _level3, _level4, _level5];
  late Level _currentLevel = _level1;
  late LevelBuilder _levelBuilder = LevelBuilder(_currentLevel);

  final Level _level1 = Level(
    tileMapUnShuffledList: [
      [LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.who],
      [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [2],
  );

  final Level _level2 = Level(
    tileMapUnShuffledList: [
      [LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.wc4, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.who],
      [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [2],
  );

  final Level _level3 = Level(
    tileMapUnShuffledList: [
      [LevelBuilder.wbl, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
      [LevelBuilder.wtr, LevelBuilder.w3l, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr],
      [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.who],
      [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg],
    ],
    generatorIndexList: [0],
    bulbIndexList: [1, 3],
  );

  final Level _level4 = Level(
    tileMapUnShuffledList: [
      [LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg],
      [LevelBuilder.wve, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who],
      [LevelBuilder.wtr, LevelBuilder.w3l, LevelBuilder.ntg, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.who],
      [LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.who, LevelBuilder.wtl, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who],
    ],
    generatorIndexList: [0],
    bulbIndexList: [1, 3, 4],
  );

  final Level _level5 = Level(
    tileMapUnShuffledList: [
      [LevelBuilder.who, LevelBuilder.w3b, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg],
      [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who],
      [LevelBuilder.wbl, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg],
      [LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.who],
      [LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.who],
      [LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.w3t, LevelBuilder.who, LevelBuilder.who],
    ],
    generatorIndexList: [0, 2],
    bulbIndexList: [1, 2, 4, 5],
  );

  void nextLevel() {
    setLevel(_levelList.indexOf(_currentLevel) + 1);
  }

  void resetLevelProgress() {
    setLevel(0);
  }

  void setLevel(int index) {
    _currentLevel = _levelList[index];
    _levelBuilder = LevelBuilder(_currentLevel);
  }

  List<Component> get currentLevelComponentList => _levelBuilder.levelComponents;

  int get wireRowCount => _levelBuilder.wireRowCount;

  int get wireColumnCount => _levelBuilder.wireColumnCount;

  bool get hasNextLevel => _levelList.indexOf(_currentLevel) != (_levelList.length - 1);
}
