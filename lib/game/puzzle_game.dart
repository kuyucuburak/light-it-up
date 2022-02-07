import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/game/level_builder.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables, HasCollidables {
  late final LevelBuilder _levelBuilder = LevelBuilder();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    List<Component> componentList = await _levelBuilder.wallList() + await _levelBuilder.tileList();
    componentList.forEach((e) => add(e));
  }
}
