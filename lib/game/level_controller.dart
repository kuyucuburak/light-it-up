import 'level_builder.dart';

class LevelController {
  late final List<List<List<String>>> levelList = [_tileMapLevel1, _tileMapLevel2, _tileMapLevel3,_tileMapLevel4,_tileMapLevel5];
  late List<List<String>> currentLevel = _tileMapLevel1;
  late LevelBuilder _levelBuilder = LevelBuilder(currentLevel);

  bool hasNextLevel = true;

  final List<List<String>> _tileMapLevel1 = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];

  final List<List<String>> _tileMapLevel2 = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];

  final List<List<String>> _tileMapLevel3 = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];

  final List<List<String>> _tileMapLevel4 = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];

  final List<List<String>> _tileMapLevel5 = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.who, LevelBuilder.who, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];

  void nextLevel() {
    int indexOfNextLevel = levelList.indexOf(currentLevel) + 1;
    currentLevel = levelList[indexOfNextLevel];
    _levelBuilder = LevelBuilder(currentLevel);

    hasNextLevel = indexOfNextLevel != (levelList.length - 1);
  }

  Future<List> createLevel() async {
    return await _levelBuilder.animationList() + await _levelBuilder.bulbList() + await _levelBuilder.wallList() + await _levelBuilder.wireList();
  }
}
