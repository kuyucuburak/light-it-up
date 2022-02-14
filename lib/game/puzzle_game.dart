import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/component/sprite/background.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late final List<List<String>> _tileMap = [
    [LevelBuilder.wc4, LevelBuilder.wbr, LevelBuilder.who, LevelBuilder.w3b, LevelBuilder.who, LevelBuilder.wbl, LevelBuilder.ntg, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.who, LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.w3l, LevelBuilder.who, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.who, LevelBuilder.w3t, LevelBuilder.who, LevelBuilder.wtl, LevelBuilder.ntg, LevelBuilder.ntg],
  ];
  late final double minWireX = AppConstants.mostTopLeftTileX;
  late final double minWireY = AppConstants.mostTopLeftTileY;
  late final double maxWireX = AppConstants.mostTopLeftTileX + ((_tileMap[0].length - 1) * AppConstants.wireSize);
  late final double maxWireY = AppConstants.mostTopLeftTileY + ((_tileMap.length - 1) * AppConstants.wireSize);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    add(await background(this));

    List<Component> componentList = await _levelBuilder.animationList() + await _levelBuilder.bulbList() + await _levelBuilder.wallList() + await _levelBuilder.wireList();
    componentList.forEach((e) => add(e));
  }

  Future<Component> background(PuzzleGame gameRef) async {
    Vector2 size = gameRef.size;
    return Background.black(
      position: Vector2(size.x / 2, size.y / 2),
      size: size,
    );
  }
}
