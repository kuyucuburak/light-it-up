import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late final List<List<String>> _tileMap = [
    [LevelBuilder.gnr, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.wcb, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg],
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

    List<Component> componentList = await _levelBuilder.wallList() + await _levelBuilder.tileList();
    componentList.forEach((e) => add(e));
  }
}
