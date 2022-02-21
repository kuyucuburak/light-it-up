import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_sprite_component.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late final List<List<String>> _tileMap = [
    [LevelBuilder.wc4, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.wcb, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.wcr, LevelBuilder.who, LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.wcl, LevelBuilder.who, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.wct, LevelBuilder.who, LevelBuilder.wtl, LevelBuilder.ntg, LevelBuilder.ntg],
  ];
  late final double minTileX = AppConstants.mostTopLeftTileX;
  late final double minTileY = AppConstants.mostTopLeftTileY;
  late final double maxTileX = AppConstants.mostTopLeftTileX + ((_tileMap[0].length - 1) * AppConstants.tileSize);
  late final double maxTileY = AppConstants.mostTopLeftTileY + ((_tileMap.length - 1) * AppConstants.tileSize);

  late List<Component> _level1ComponentList;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    BaseSpriteComponent baseSpriteComponent = BaseSpriteComponent(
      position: Vector2(size.x / 2, size.y / 2),
      size: size,
      priority: priority,
      spriteLoader: AssetProvider.imageBackground,
    );
    add(baseSpriteComponent);

    _level1ComponentList = await _levelBuilder.wallList() + await _levelBuilder.tileList() + await _levelBuilder.animationList() + await _levelBuilder.bulbList();
  }

  void startGamePlay() {
    _level1ComponentList.forEach((e) => add(e));
  }

  void reset() {
    _level1ComponentList.forEach((e) {
      e.removeFromParent();
    });
  }
}
