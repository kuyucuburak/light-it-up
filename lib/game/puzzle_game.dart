import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables, HasCollidables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late final List<List<String>> _tileMap = [
    [LevelBuilder.fnt, LevelBuilder.pho, LevelBuilder.ntg, LevelBuilder.pbl, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.pve, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.pbl],
    [LevelBuilder.ntg, LevelBuilder.ptr, LevelBuilder.ntg, LevelBuilder.pho, LevelBuilder.pho, LevelBuilder.pho, LevelBuilder.pho, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.pve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.cnv],
  ];

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    List<Component> componentList = await _levelBuilder.wallList() + await _levelBuilder.tileList();
    componentList.forEach((e) => add(e));
  }
}
