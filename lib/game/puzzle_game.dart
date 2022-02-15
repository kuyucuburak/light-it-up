import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/sprite/wire.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late final List<Component> tiles;
  late final List<List<String>> _tileMap = [
    [LevelBuilder.fnt, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.wcb, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.wcr, LevelBuilder.who, LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.wcl, LevelBuilder.who, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.wct, LevelBuilder.who, LevelBuilder.wtl, LevelBuilder.ntg, LevelBuilder.cnv],
  ];
  late final double minTileX = AppConstants.mostTopLeftTileX;
  late final double minTileY = AppConstants.mostTopLeftTileY;
  late final double maxTileX = AppConstants.mostTopLeftTileX + ((_tileMap[0].length - 1) * AppConstants.tileSize);
  late final double maxTileY = AppConstants.mostTopLeftTileY + ((_tileMap.length - 1) * AppConstants.tileSize);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    tiles = await _levelBuilder.tileList();
    List<Component> componentList = await _levelBuilder.wallList() + tiles;
    componentList.forEach((e) => add(e));
  }

  void updateAndLookForAWay() {
    List<List<Wire?>> wireMap = List.generate(_tileMap.length,
        (i) => List.filled(_tileMap[0].length, null, growable: false),
        growable: false);
    tiles.forEach((element) {
      if (element is Wire) {
        int j = ((element.position.x - AppConstants.mostTopLeftTileX) / AppConstants.tileSize) as int;
        int i = ((element.position.y - AppConstants.mostTopLeftTileY) / AppConstants.tileSize) as int;
        wireMap[i][j] = element;
      }
    });
  }
}
