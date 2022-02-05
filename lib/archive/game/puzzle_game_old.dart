import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:water_to_trees/archive/components/background.dart';
import 'package:water_to_trees/archive/components/player.dart';
import 'package:water_to_trees/archive/util/asset_provider.dart';

class PuzzleGameOld extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    player = Player();

    add(Background());
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
  }
}
